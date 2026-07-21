package handlers

import (
	"log/slog"
	"net/http"
	"time"

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
