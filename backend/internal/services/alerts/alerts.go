// Package alerts owns the alert lifecycle: trigger, respond, resolve.
package alerts

import (
	"context"
	"errors"
	"fmt"
	"log/slog"
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"

	"github.com/cordea/hark/internal/config"
	"github.com/cordea/hark/internal/models"
	"github.com/cordea/hark/internal/services/fcm"
	"github.com/cordea/hark/internal/services/i18n"
)

var (
	ErrInvalidType     = errors.New("invalid alert type")
	ErrNoRecipients    = errors.New("no recipients")
	ErrAlertNotFound   = errors.New("alert not found")
	ErrUserNotOnAlert  = errors.New("user not a recipient")
	ErrAlreadyResolved = errors.New("alert already resolved")
	ErrAlertNotActive  = errors.New("alert is not active")
	ErrInvalidAction   = errors.New("invalid action")
)

type Service struct {
	DB        *gorm.DB
	Sender    fcm.Sender
	Localizer *i18n.Localizer
	// AlertTypes is the operator-supplied catalog used to validate trigger
	// requests and to stamp the display name/color into each outgoing push
	// so the client can render the badge without a separate lookup.
	AlertTypes config.AlertTypes
	// PublicURL is stamped into every alert payload as `org_id`. It's the
	// stable server identifier the mobile client uses to route the push to
	// the right stored profile before it makes any authenticated call.
	PublicURL string
}

// Trigger creates the alert and fans out a high-priority push. When
// targetUserIDs is empty, defaults to ALL active users.
func (s *Service) Trigger(ctx context.Context, alertType string, targetUserIDs []string) (models.Alert, error) {
	typ, ok := s.AlertTypes.Lookup(alertType)
	if !ok {
		return models.Alert{}, ErrInvalidType
	}

	var alert models.Alert
	var devices []models.Device
	err := s.DB.Transaction(func(tx *gorm.DB) error {
		var users []models.User
		q := tx
		if len(targetUserIDs) > 0 {
			q = q.Where("id IN ?", targetUserIDs)
		}
		if err := q.Find(&users).Error; err != nil {
			return err
		}
		if len(users) == 0 {
			return ErrNoRecipients
		}

		alert = models.Alert{
			ID:          uuid.NewString(),
			Type:        alertType,
			Status:      models.AlertStatusActive,
			IsBroadcast: len(targetUserIDs) == 0,
			TriggeredAt: time.Now().UTC(),
		}
		if err := tx.Create(&alert).Error; err != nil {
			return err
		}

		recips := make([]models.AlertRecipient, 0, len(users))
		userIDs := make([]string, 0, len(users))
		for _, u := range users {
			recips = append(recips, models.AlertRecipient{
				AlertID:        alert.ID,
				UserID:         u.ID,
				ResponseStatus: models.RecipientPending,
			})
			userIDs = append(userIDs, u.ID)
		}
		if err := tx.Create(&recips).Error; err != nil {
			return err
		}

		if err := tx.Where("user_id IN ?", userIDs).Find(&devices).Error; err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		return models.Alert{}, err
	}

	s.fanoutAlert(ctx, alert, typ, devices)
	return alert, nil
}

// Remind re-sends the alert notification to every device that belongs to the
// alert's recipients. It intentionally does not touch the alert or recipient
// rows, so acknowledgement and resolution state remain unchanged.
func (s *Service) Remind(ctx context.Context, alertID string) (models.Alert, int, error) {
	var alert models.Alert
	if err := s.DB.First(&alert, "id = ?", alertID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return alert, 0, ErrAlertNotFound
		}
		return alert, 0, err
	}
	if alert.Status != models.AlertStatusActive {
		return alert, 0, ErrAlertNotActive
	}
	typ, ok := s.AlertTypes.Lookup(alert.Type)
	if !ok {
		return alert, 0, ErrInvalidType
	}
	var devices []models.Device
	q := s.DB.Joins("JOIN alert_recipients ar ON ar.user_id = devices.user_id").
		Where("ar.alert_id = ?", alert.ID)
	if err := q.Find(&devices).Error; err != nil {
		return alert, 0, err
	}
	s.fanoutAlert(ctx, alert, typ, devices)
	return alert, len(devices), nil
}

// Respond records the caller's ack/decline on the alert. It does NOT resolve
// the alert — only an admin's explicit /resolve-admin call moves an alert to
// the resolved state. This keeps every recipient's response visible on the
// admin console until the on-call situation is actually closed out.
func (s *Service) Respond(ctx context.Context, alertID, userID, action string) (models.Alert, bool, error) {
	_ = ctx
	if action != models.RecipientAcknowledged && action != models.RecipientDeclined {
		return models.Alert{}, false, ErrInvalidAction
	}

	var alert models.Alert
	if err := s.DB.First(&alert, "id = ?", alertID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return alert, false, ErrAlertNotFound
		}
		return alert, false, err
	}

	now := time.Now().UTC()
	res := s.DB.Model(&models.AlertRecipient{}).
		Where("alert_id = ? AND user_id = ?", alertID, userID).
		Updates(map[string]any{
			"response_status": action,
			"responded_at":    now,
		})
	if res.Error != nil {
		return alert, false, res.Error
	}
	if res.RowsAffected == 0 {
		return alert, false, ErrUserNotOnAlert
	}
	return alert, true, nil
}

// ResolveAdmin manually resolves the alert with the sentinel admin responder.
// Idempotent: repeated calls on an already-resolved alert are a no-op success.
func (s *Service) ResolveAdmin(ctx context.Context, alertID string) (models.Alert, bool, error) {
	var alert models.Alert
	if err := s.DB.First(&alert, "id = ?", alertID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return alert, false, ErrAlertNotFound
		}
		return alert, false, err
	}
	if alert.Status == models.AlertStatusResolved {
		return alert, false, nil
	}

	now := time.Now().UTC()
	admin := models.AdminResponderID
	res := s.DB.Model(&models.Alert{}).
		Where("id = ? AND status = ?", alertID, models.AlertStatusActive).
		Updates(map[string]any{
			"status":       models.AlertStatusResolved,
			"responder_id": admin,
			"resolved_at":  now,
		})
	if res.Error != nil {
		return alert, false, res.Error
	}
	if res.RowsAffected == 0 {
		_ = s.DB.First(&alert, "id = ?", alertID).Error
		return alert, false, nil
	}

	alert.Status = models.AlertStatusResolved
	alert.ResponderID = &admin
	alert.ResolvedAt = &now

	if err := s.silentResolveFanout(ctx, alertID, ""); err != nil {
		slog.Error("silent resolve fanout", "err", err, "alert_id", alertID)
	}
	return alert, true, nil
}

// silentResolveFanout notifies every device on the alert except `exceptUserID`
// that the alert is resolved.
func (s *Service) silentResolveFanout(ctx context.Context, alertID, exceptUserID string) error {
	var devices []models.Device
	q := s.DB.
		Joins("JOIN alert_recipients ar ON ar.user_id = devices.user_id").
		Where("ar.alert_id = ?", alertID)
	if exceptUserID != "" {
		q = q.Where("devices.user_id <> ?", exceptUserID)
	}
	if err := q.Find(&devices).Error; err != nil {
		return err
	}
	if len(devices) == 0 {
		return nil
	}
	msgs := make([]fcm.Message, 0, len(devices))
	for _, d := range devices {
		msgs = append(msgs, fcm.Message{
			Token:   d.FCMToken,
			Kind:    fcm.KindResolve,
			AlertID: alertID,
			Title:   s.t(d.Locale, "push.resolve.title", nil),
			Body:    s.t(d.Locale, "push.resolve.body", nil),
			Data: map[string]string{
				"kind":     fcm.KindResolve,
				"alert_id": alertID,
				"org_id":   s.PublicURL,
			},
		})
	}
	res := s.Sender.Send(ctx, msgs)
	s.pruneDeadTokens(res.DeadTokens)
	return nil
}

func (s *Service) fanoutAlert(ctx context.Context, alert models.Alert, typ config.AlertType, devices []models.Device) {
	if len(devices) == 0 {
		return
	}
	msgs := make([]fcm.Message, 0, len(devices))
	titleArgs := map[string]string{"name": typ.Name}
	for _, d := range devices {
		msgs = append(msgs, fcm.Message{
			Token:   d.FCMToken,
			Kind:    fcm.KindAlert,
			AlertID: alert.ID,
			Title:   s.t(d.Locale, "push.alert.title", titleArgs),
			Body:    s.t(d.Locale, "push.alert.body", nil),
			Data: map[string]string{
				"kind":       fcm.KindAlert,
				"alert_id":   alert.ID,
				"type":       alert.Type,
				"type_name":  typ.Name,
				"type_color": typ.Color,
				"org_id":     s.PublicURL,
			},
		})
	}
	res := s.Sender.Send(ctx, msgs)
	s.pruneDeadTokens(res.DeadTokens)
}

// TestPing sends a data-only test payload to every device belonging to the user.
func (s *Service) TestPing(ctx context.Context, userID string) error {
	var devices []models.Device
	if err := s.DB.Where("user_id = ?", userID).Find(&devices).Error; err != nil {
		return err
	}
	if len(devices) == 0 {
		return fmt.Errorf("no devices for user")
	}
	msgs := make([]fcm.Message, 0, len(devices))
	for _, d := range devices {
		msgs = append(msgs, fcm.Message{
			Token: d.FCMToken,
			Kind:  fcm.KindTest,
			Title: s.t(d.Locale, "push.test.title", nil),
			Body:  s.t(d.Locale, "push.test.body", nil),
			Data: map[string]string{
				"kind":   fcm.KindTest,
				"org_id": s.PublicURL,
			},
		})
	}
	res := s.Sender.Send(ctx, msgs)
	s.pruneDeadTokens(res.DeadTokens)
	return nil
}

// t resolves a localization key against the service's Localizer. Falls back
// to just the key when no Localizer is configured (test wiring, older
// callers), so notification title/body degrade gracefully instead of blowing
// up the fanout.
func (s *Service) t(locale, key string, args map[string]string) string {
	if s.Localizer == nil {
		return key
	}
	return s.Localizer.T(locale, key, args)
}

func (s *Service) pruneDeadTokens(tokens []string) {
	if len(tokens) == 0 {
		return
	}
	if err := s.DB.Where("fcm_token IN ?", tokens).Delete(&models.Device{}).Error; err != nil {
		slog.Warn("prune dead tokens", "err", err, "count", len(tokens))
	} else {
		slog.Info("pruned dead tokens", "count", len(tokens))
	}
}
