package handlers

import (
	"errors"
	"log/slog"
	"net/http"

	"github.com/go-chi/chi/v5"
	"gorm.io/gorm"

	"github.com/cordea/hark/internal/models"
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

// KickUser hard-deletes the user record (cascade removes their devices,
// credentials, and alert_recipients rows). This is the spec's Instant
// Session Invalidation mechanism: once the user row is gone, the JWT
// middleware's user-existence check fails for every subsequent request
// carrying an old token.
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
