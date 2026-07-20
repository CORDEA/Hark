package handlers

import (
	"errors"
	"log/slog"
	"net/http"
	"strconv"
	"time"

	"github.com/go-chi/chi/v5"
	"gorm.io/gorm"

	"github.com/cordea/hark/internal/models"
)

type statsResponse struct {
	ActiveSubscribers int64 `json:"active_subscribers"`
	TotalSubscribers  int64 `json:"total_subscribers"`
	AlertsToday       int64 `json:"alerts_today"`
}

func (h *API) Stats(w http.ResponseWriter, r *http.Request) {
	var s statsResponse
	if err := h.DB.Model(&models.User{}).Count(&s.TotalSubscribers).Error; err != nil {
		fail(w, http.StatusInternalServerError, "db", err.Error())
		return
	}
	// A user is "active" when they have at least one registered device —
	// i.e. a device we could actually push to. With passkeys, a user row
	// only exists after a successful register ceremony, so the "invited"
	// pre-registration state no longer applies.
	if err := h.DB.Model(&models.User{}).
		Where("id IN (?)", h.DB.Model(&models.Device{}).Select("DISTINCT user_id")).
		Count(&s.ActiveSubscribers).Error; err != nil {
		fail(w, http.StatusInternalServerError, "db", err.Error())
		return
	}
	startOfDayUTC := time.Now().UTC().Truncate(24 * time.Hour)
	if err := h.DB.Model(&models.Alert{}).Where("triggered_at >= ?", startOfDayUTC).Count(&s.AlertsToday).Error; err != nil {
		fail(w, http.StatusInternalServerError, "db", err.Error())
		return
	}
	ok(w, s)
}

type alertSummary struct {
	ID            string     `json:"id"`
	Type          string     `json:"type"`
	Status        string     `json:"status"`
	IsBroadcast   bool       `json:"is_broadcast"`
	TriggeredAt   time.Time  `json:"triggered_at"`
	ResolvedAt    *time.Time `json:"resolved_at"`
	ResponderID   *string    `json:"responder_id"`
	ResponderName *string    `json:"responder_name"`
	TargetNames   []string   `json:"target_names"`
	AckCount      int        `json:"ack_count"`
	PendingCount  int        `json:"pending_count"`
	DeclineCount  int        `json:"decline_count"`
}

type recipientView struct {
	UserID         string     `json:"user_id"`
	Name           string     `json:"name"`
	ResponseStatus string     `json:"response_status"`
	RespondedAt    *time.Time `json:"responded_at"`
}

type alertDetail struct {
	alertSummary
	Recipients []recipientView `json:"recipients"`
}

// ListAlerts returns all alerts (optionally filtered by ?status=active|resolved
// and limited by ?limit=N, default 50) with a light summary of recipients.
func (h *API) ListAlerts(w http.ResponseWriter, r *http.Request) {
	q := h.DB.Model(&models.Alert{}).Order("triggered_at desc")
	if s := r.URL.Query().Get("status"); s != "" {
		q = q.Where("status = ?", s)
	}
	limit := 50
	if l := r.URL.Query().Get("limit"); l != "" {
		if n, err := strconv.Atoi(l); err == nil && n > 0 && n <= 500 {
			limit = n
		}
	}
	var alerts []models.Alert
	if err := q.Limit(limit).Find(&alerts).Error; err != nil {
		fail(w, http.StatusInternalServerError, "db", err.Error())
		return
	}
	if len(alerts) == 0 {
		ok(w, []alertSummary{})
		return
	}

	summaries, err := h.buildSummaries(alerts)
	if err != nil {
		slog.Error("list alerts", "err", err)
		fail(w, http.StatusInternalServerError, "db", err.Error())
		return
	}
	ok(w, summaries)
}

func (h *API) GetAlert(w http.ResponseWriter, r *http.Request) {
	id := chi.URLParam(r, "id")
	var alert models.Alert
	if err := h.DB.First(&alert, "id = ?", id).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			fail(w, http.StatusNotFound, "not_found", "alert not found")
			return
		}
		fail(w, http.StatusInternalServerError, "db", err.Error())
		return
	}

	summaries, err := h.buildSummaries([]models.Alert{alert})
	if err != nil {
		fail(w, http.StatusInternalServerError, "db", err.Error())
		return
	}
	summary := summaries[0]

	var recips []models.AlertRecipient
	if err := h.DB.Where("alert_id = ?", id).Find(&recips).Error; err != nil {
		fail(w, http.StatusInternalServerError, "db", err.Error())
		return
	}
	userIDs := make([]string, 0, len(recips))
	for _, r := range recips {
		userIDs = append(userIDs, r.UserID)
	}
	names := h.resolveUserNames(userIDs)

	views := make([]recipientView, 0, len(recips))
	for _, rc := range recips {
		views = append(views, recipientView{
			UserID:         rc.UserID,
			Name:           nameOrFallback(names[rc.UserID], "Unknown"),
			ResponseStatus: rc.ResponseStatus,
			RespondedAt:    rc.RespondedAt,
		})
	}
	ok(w, alertDetail{alertSummary: summary, Recipients: views})
}

func (h *API) buildSummaries(alerts []models.Alert) ([]alertSummary, error) {
	alertIDs := make([]string, 0, len(alerts))
	for _, a := range alerts {
		alertIDs = append(alertIDs, a.ID)
	}

	// Load all recipient rows for these alerts in one shot.
	var recips []models.AlertRecipient
	if err := h.DB.Where("alert_id IN ?", alertIDs).Find(&recips).Error; err != nil {
		return nil, err
	}

	// Gather every user_id we'll need names for (recipients + responders).
	uidSet := map[string]struct{}{}
	for _, r := range recips {
		uidSet[r.UserID] = struct{}{}
	}
	for _, a := range alerts {
		if a.ResponderID != nil && *a.ResponderID != models.AdminResponderID {
			uidSet[*a.ResponderID] = struct{}{}
		}
	}
	uids := make([]string, 0, len(uidSet))
	for u := range uidSet {
		uids = append(uids, u)
	}
	names := h.resolveUserNames(uids)

	// Group recipients by alert_id.
	byAlert := map[string][]models.AlertRecipient{}
	for _, r := range recips {
		byAlert[r.AlertID] = append(byAlert[r.AlertID], r)
	}

	out := make([]alertSummary, 0, len(alerts))
	for _, a := range alerts {
		s := alertSummary{
			ID:          a.ID,
			Type:        a.Type,
			Status:      a.Status,
			IsBroadcast: a.IsBroadcast,
			TriggeredAt: a.TriggeredAt,
			ResolvedAt:  a.ResolvedAt,
			ResponderID: a.ResponderID,
		}
		if a.ResponderID != nil {
			if *a.ResponderID == models.AdminResponderID {
				n := "Admin"
				s.ResponderName = &n
			} else if n, ok := names[*a.ResponderID]; ok {
				s.ResponderName = &n
			}
		}
		for _, r := range byAlert[a.ID] {
			switch r.ResponseStatus {
			case models.RecipientAcknowledged:
				s.AckCount++
			case models.RecipientPending:
				s.PendingCount++
			case models.RecipientDeclined:
				s.DeclineCount++
			}
			if !a.IsBroadcast {
				if n, ok := names[r.UserID]; ok {
					s.TargetNames = append(s.TargetNames, n)
				}
			}
		}
		if s.TargetNames == nil {
			s.TargetNames = []string{}
		}
		out = append(out, s)
	}
	return out, nil
}

func (h *API) resolveUserNames(userIDs []string) map[string]string {
	names := map[string]string{}
	if len(userIDs) == 0 {
		return names
	}
	var users []models.User
	if err := h.DB.Select("id, display_name").Where("id IN ?", userIDs).Find(&users).Error; err != nil {
		slog.Warn("resolve user names", "err", err)
		return names
	}
	for _, u := range users {
		names[u.ID] = u.DisplayName
	}
	return names
}

func nameOrFallback(name, fallback string) string {
	if name == "" {
		return fallback
	}
	return name
}
