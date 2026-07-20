package handlers

import (
	"errors"
	"log/slog"
	"net/http"
	"strings"
	"time"

	"gorm.io/gorm"

	"github.com/cordea/hark/internal/models"
)

type userView struct {
	ID               string       `json:"id"`
	DisplayName      string       `json:"display_name"`
	CreatedAt        time.Time    `json:"created_at"`
	Devices          []deviceView `json:"devices"`
	DevicesCount     int          `json:"devices_count"`
	CredentialsCount int          `json:"credentials_count"`
	LastActivityAt   *time.Time   `json:"last_activity_at,omitempty"`
}

type deviceView struct {
	ID         string    `json:"id"`
	DeviceName string    `json:"device_name"`
	CreatedAt  time.Time `json:"created_at"`
}

func (h *API) ListUsers(w http.ResponseWriter, r *http.Request) {
	var users []models.User
	if err := h.DB.Preload("Devices").Preload("Credentials").Order("created_at desc").Find(&users).Error; err != nil {
		slog.Error("list users", "err", err)
		fail(w, http.StatusInternalServerError, "db", "could not list users")
		return
	}

	views := make([]userView, 0, len(users))
	for _, u := range users {
		devs := make([]deviceView, 0, len(u.Devices))
		var lastAt *time.Time
		for _, d := range u.Devices {
			devs = append(devs, deviceView{ID: d.ID, DeviceName: d.DeviceName, CreatedAt: d.CreatedAt})
			if lastAt == nil || d.CreatedAt.After(*lastAt) {
				t := d.CreatedAt
				lastAt = &t
			}
		}
		views = append(views, userView{
			ID:               u.ID,
			DisplayName:      u.DisplayName,
			CreatedAt:        u.CreatedAt,
			Devices:          devs,
			DevicesCount:     len(u.Devices),
			CredentialsCount: len(u.Credentials),
			LastActivityAt:   lastAt,
		})
	}
	ok(w, views)
}

type leaveRequest struct {
	UserID   string `json:"user_id"`
	FCMToken string `json:"fcm_token"`
}

// Leave removes the caller's device. Still auth-less during the migration
// window; M4 flips it to a JWT-guarded DELETE /api/devices/self.
func (h *API) Leave(w http.ResponseWriter, r *http.Request) {
	var req leaveRequest
	if err := decodeJSON(r, &req); err != nil {
		fail(w, http.StatusBadRequest, "bad_json", err.Error())
		return
	}
	req.UserID = strings.TrimSpace(req.UserID)
	req.FCMToken = strings.TrimSpace(req.FCMToken)
	if req.UserID == "" || req.FCMToken == "" {
		fail(w, http.StatusBadRequest, "missing_fields", "user_id and fcm_token are required")
		return
	}

	err := h.DB.Transaction(func(tx *gorm.DB) error {
		res := tx.Where("user_id = ? AND fcm_token = ?", req.UserID, req.FCMToken).
			Delete(&models.Device{})
		if res.Error != nil {
			return res.Error
		}
		if res.RowsAffected == 0 {
			return errNotFound
		}

		var remaining int64
		if err := tx.Model(&models.Device{}).Where("user_id = ?", req.UserID).Count(&remaining).Error; err != nil {
			return err
		}
		if remaining == 0 {
			if err := tx.Where("id = ?", req.UserID).Delete(&models.User{}).Error; err != nil {
				return err
			}
		}
		return nil
	})

	switch {
	case err == nil:
		ok(w, map[string]string{"status": "left"})
	case errors.Is(err, errNotFound):
		fail(w, http.StatusNotFound, "not_found", "device not registered")
	default:
		slog.Error("leave", "err", err)
		fail(w, http.StatusInternalServerError, "db", "could not remove device")
	}
}

var errNotFound = errors.New("not found")
