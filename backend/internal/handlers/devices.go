package handlers

import (
	"errors"
	"log/slog"
	"net/http"
	"strings"
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"

	appmw "github.com/cordea/hark/internal/middleware"
	"github.com/cordea/hark/internal/models"
)

type registerDeviceRequest struct {
	FCMToken   string `json:"fcm_token"`
	DeviceName string `json:"device_name"`
	Locale     string `json:"locale"`
}

type registerDeviceResponse struct {
	DeviceID string `json:"device_id"`
}

// RegisterDevice persists an FCM registration for the caller. Idempotent on
// (user_id, fcm_token): a repeat call updates the row's device_name / locale
// rather than creating a duplicate. Mounted under JWT — the caller is
// resolved from the request context, not the body.
func (h *API) RegisterDevice(w http.ResponseWriter, r *http.Request) {
	user, ok := appmw.UserFromContext(r.Context())
	if !ok {
		fail(w, http.StatusUnauthorized, "unauthorized", "missing user context")
		return
	}

	var req registerDeviceRequest
	if err := decodeJSON(r, &req); err != nil {
		fail(w, http.StatusBadRequest, "bad_json", err.Error())
		return
	}
	req.FCMToken = strings.TrimSpace(req.FCMToken)
	req.DeviceName = strings.TrimSpace(req.DeviceName)
	req.Locale = strings.TrimSpace(req.Locale)
	if req.FCMToken == "" {
		fail(w, http.StatusBadRequest, "missing_fields", "fcm_token is required")
		return
	}
	if req.DeviceName == "" {
		req.DeviceName = "device"
	}
	if req.Locale == "" {
		req.Locale = "en"
	}

	now := time.Now().UTC()
	var device models.Device
	err := h.DB.Transaction(func(tx *gorm.DB) error {
		res := tx.Where("fcm_token = ?", req.FCMToken).First(&device)
		if res.Error != nil && !errors.Is(res.Error, gorm.ErrRecordNotFound) {
			return res.Error
		}
		if res.Error == nil {
			// FCM token already registered — reassign to caller (handles
			// device-hand-off and re-register scenarios).
			device.UserID = user.ID
			device.DeviceName = req.DeviceName
			device.Locale = req.Locale
			return tx.Save(&device).Error
		}
		device = models.Device{
			ID:         uuid.NewString(),
			UserID:     user.ID,
			FCMToken:   req.FCMToken,
			DeviceName: req.DeviceName,
			Locale:     req.Locale,
			CreatedAt:  now,
		}
		return tx.Create(&device).Error
	})
	if err != nil {
		slog.Error("register device", "err", err)
		fail(w, http.StatusInternalServerError, "db", "could not register device")
		return
	}

	created(w, registerDeviceResponse{DeviceID: device.ID})
}
