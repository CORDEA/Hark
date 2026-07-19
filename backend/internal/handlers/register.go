package handlers

import (
	"errors"
	"log/slog"
	"net/http"
	"strings"
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"

	"github.com/cordea/hark/internal/models"
)

type registerRequest struct {
	InvitationCode string `json:"invitation_code"`
	FCMToken       string `json:"fcm_token"`
	DeviceName     string `json:"device_name"`
	Locale         string `json:"locale"`
}

type registerResponse struct {
	UserID   string `json:"user_id"`
	DeviceID string `json:"device_id"`
	OrgName  string `json:"org_name"`
	OrgID    string `json:"org_id"`
}

func (h *API) Register(w http.ResponseWriter, r *http.Request) {
	var req registerRequest
	if err := decodeJSON(r, &req); err != nil {
		fail(w, http.StatusBadRequest, "bad_json", err.Error())
		return
	}
	req.InvitationCode = strings.TrimSpace(req.InvitationCode)
	req.FCMToken = strings.TrimSpace(req.FCMToken)
	if req.InvitationCode == "" || req.FCMToken == "" {
		fail(w, http.StatusBadRequest, "missing_fields", "invitation_code and fcm_token are required")
		return
	}

	var user models.User
	if err := h.DB.Where("invitation_code = ?", req.InvitationCode).First(&user).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			fail(w, http.StatusNotFound, "invalid_code", "invitation code not found")
			return
		}
		slog.Error("lookup user", "err", err)
		fail(w, http.StatusInternalServerError, "db", "lookup failed")
		return
	}

	locale := defaultLocale(req.Locale)

	// Idempotent per fcm_token: if a device row already exists, reuse it and
	// re-point it at this user (supports token rotation).
	var device models.Device
	err := h.DB.Where("fcm_token = ?", req.FCMToken).First(&device).Error
	switch {
	case err == nil:
		device.UserID = user.ID
		if req.DeviceName != "" {
			device.DeviceName = req.DeviceName
		}
		device.Locale = locale
		if err := h.DB.Save(&device).Error; err != nil {
			slog.Error("update device", "err", err)
			fail(w, http.StatusInternalServerError, "db", "could not update device")
			return
		}
	case errors.Is(err, gorm.ErrRecordNotFound):
		device = models.Device{
			ID:         uuid.NewString(),
			UserID:     user.ID,
			FCMToken:   req.FCMToken,
			DeviceName: defaultDeviceName(req.DeviceName),
			Locale:     locale,
			CreatedAt:  time.Now().UTC(),
		}
		if err := h.DB.Create(&device).Error; err != nil {
			slog.Error("create device", "err", err)
			fail(w, http.StatusInternalServerError, "db", "could not create device")
			return
		}
	default:
		slog.Error("lookup device", "err", err)
		fail(w, http.StatusInternalServerError, "db", "lookup failed")
		return
	}

	if user.Status != models.UserStatusActive {
		user.Status = models.UserStatusActive
		if err := h.DB.Model(&models.User{}).Where("id = ?", user.ID).
			Update("status", models.UserStatusActive).Error; err != nil {
			slog.Error("activate user", "err", err)
		}
	}

	created(w, registerResponse{
		UserID:   user.ID,
		DeviceID: device.ID,
		OrgName:  h.Config.OrgName,
		OrgID:    h.Config.PublicURL,
	})
}

func defaultDeviceName(name string) string {
	if name == "" {
		return "device"
	}
	return name
}

func defaultLocale(locale string) string {
	locale = strings.TrimSpace(locale)
	if locale == "" {
		return "en"
	}
	return locale
}
