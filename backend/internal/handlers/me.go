package handlers

import (
	"log/slog"
	"net/http"
	"time"

	appmw "github.com/cordea/hark/internal/middleware"
	"github.com/cordea/hark/internal/models"
)

type meResponse struct {
	User        meUser         `json:"user"`
	OrgName     string         `json:"org_name"`
	Devices     []meDevice     `json:"devices"`
	Credentials []meCredential `json:"credentials"`
}

type meUser struct {
	ID          string    `json:"id"`
	DisplayName string    `json:"display_name"`
	CreatedAt   time.Time `json:"created_at"`
}

type meDevice struct {
	ID         string    `json:"id"`
	DeviceName string    `json:"device_name"`
	Locale     string    `json:"locale"`
	CreatedAt  time.Time `json:"created_at"`
}

type meCredential struct {
	ID         uint       `json:"id"`
	Nickname   string     `json:"nickname"`
	CreatedAt  time.Time  `json:"created_at"`
	LastUsedAt *time.Time `json:"last_used_at,omitempty"`
}

// Me returns the caller's profile plus the server's public org name. The
// mobile client uses this to hydrate the org list on demand — secure storage
// only holds `{server_url, user_id, auth_token}`, so anything human-readable
// (org name, device list, credential list) is fetched fresh here.
func (h *API) Me(w http.ResponseWriter, r *http.Request) {
	user, hasUser := appmw.UserFromContext(r.Context())
	if !hasUser {
		fail(w, http.StatusUnauthorized, "unauthorized", "missing user context")
		return
	}

	var devices []models.Device
	if err := h.DB.Where("user_id = ?", user.ID).Order("created_at desc").Find(&devices).Error; err != nil {
		slog.Error("me devices", "err", err)
		fail(w, http.StatusInternalServerError, "db", "could not load devices")
		return
	}
	var creds []models.Credential
	if err := h.DB.Where("user_id = ?", user.ID).Order("created_at desc").Find(&creds).Error; err != nil {
		slog.Error("me credentials", "err", err)
		fail(w, http.StatusInternalServerError, "db", "could not load credentials")
		return
	}

	devViews := make([]meDevice, 0, len(devices))
	for _, d := range devices {
		devViews = append(devViews, meDevice{
			ID:         d.ID,
			DeviceName: d.DeviceName,
			Locale:     d.Locale,
			CreatedAt:  d.CreatedAt,
		})
	}
	credViews := make([]meCredential, 0, len(creds))
	for _, c := range creds {
		credViews = append(credViews, meCredential{
			ID:         c.ID,
			Nickname:   c.Nickname,
			CreatedAt:  c.CreatedAt,
			LastUsedAt: c.LastUsedAt,
		})
	}

	ok(w, meResponse{
		User: meUser{
			ID:          user.ID,
			DisplayName: user.DisplayName,
			CreatedAt:   user.CreatedAt,
		},
		OrgName:     h.Config.OrgName,
		Devices:     devViews,
		Credentials: credViews,
	})
}
