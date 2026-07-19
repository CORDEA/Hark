package handlers

import (
	"errors"
	"log/slog"
	"net/http"

	"github.com/go-chi/chi/v5"
	"gorm.io/gorm"

	"github.com/cordea/hark/internal/models"
	"github.com/cordea/hark/internal/services/invites"
)

type testPingResponse struct {
	UserID string `json:"user_id"`
	Sent   int    `json:"sent"`
}

// TestPing fires a data-only test payload to every device belonging to the
// user. Used by the Subscribers dashboard to verify a device is reachable
// without triggering a real alert.
func (h *API) TestPing(w http.ResponseWriter, r *http.Request) {
	userID := chi.URLParam(r, "id")
	if userID == "" {
		fail(w, http.StatusBadRequest, "missing_id", "user id required")
		return
	}

	var user models.User
	if err := h.DB.First(&user, "id = ?", userID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			fail(w, http.StatusNotFound, "not_found", "user not found")
			return
		}
		fail(w, http.StatusInternalServerError, "db", err.Error())
		return
	}

	if err := h.Alerts.TestPing(r.Context(), userID); err != nil {
		slog.Error("test-ping", "err", err)
		fail(w, http.StatusInternalServerError, "internal", err.Error())
		return
	}

	var deviceCount int64
	_ = h.DB.Model(&models.Device{}).Where("user_id = ?", userID).Count(&deviceCount).Error
	ok(w, testPingResponse{UserID: userID, Sent: int(deviceCount)})
}

type reinviteResponse struct {
	UserID         string `json:"user_id"`
	InvitationCode string `json:"invitation_code"`
	DeepLink       string `json:"deep_link"`
	QRPayload      string `json:"qr_payload"`
	QRImage        string `json:"qr_image"`
}

// Reinvite regenerates the user's invitation code and flips them back to
// invited status. Existing devices are kept — the new code is for
// re-onboarding a lost device or handing off to a coworker.
func (h *API) Reinvite(w http.ResponseWriter, r *http.Request) {
	userID := chi.URLParam(r, "id")
	if userID == "" {
		fail(w, http.StatusBadRequest, "missing_id", "user id required")
		return
	}

	var user models.User
	if err := h.DB.First(&user, "id = ?", userID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			fail(w, http.StatusNotFound, "not_found", "user not found")
			return
		}
		fail(w, http.StatusInternalServerError, "db", err.Error())
		return
	}

	// Retry loop mirrors Invite() — code collisions are astronomically rare
	// but we don't want to 500 on the off chance.
	for attempt := 0; attempt < 5; attempt++ {
		code, err := invites.NewCode()
		if err != nil {
			fail(w, http.StatusInternalServerError, "code_gen", err.Error())
			return
		}
		err = h.DB.Model(&models.User{}).
			Where("id = ?", userID).
			Updates(map[string]any{
				"invitation_code": code,
				"status":          models.UserStatusInvited,
			}).Error
		if err == nil {
			user.InvitationCode = code
			user.Status = models.UserStatusInvited
			break
		}
		if !isUniqueViolation(err) {
			slog.Error("reinvite", "err", err)
			fail(w, http.StatusInternalServerError, "db", "could not update user")
			return
		}
	}

	deepLink := invites.DeepLink(h.Config.PublicURL, user.InvitationCode)
	qrImage, err := invites.QRDataURL(deepLink)
	if err != nil {
		slog.Error("qr encode", "err", err)
		fail(w, http.StatusInternalServerError, "qr_encode", err.Error())
		return
	}

	ok(w, reinviteResponse{
		UserID:         userID,
		InvitationCode: user.InvitationCode,
		DeepLink:       deepLink,
		QRPayload:      deepLink,
		QRImage:        qrImage,
	})
}

// KickUser hard-deletes the user record (cascade removes their devices and
// alert_recipients rows). Used by the Subscribers dashboard.
func (h *API) KickUser(w http.ResponseWriter, r *http.Request) {
	userID := chi.URLParam(r, "id")
	if userID == "" {
		fail(w, http.StatusBadRequest, "missing_id", "user id required")
		return
	}
	res := h.DB.Where("id = ?", userID).Delete(&models.User{})
	if res.Error != nil {
		fail(w, http.StatusInternalServerError, "db", res.Error.Error())
		return
	}
	if res.RowsAffected == 0 {
		fail(w, http.StatusNotFound, "not_found", "user not found")
		return
	}
	ok(w, map[string]string{"status": "kicked"})
}
