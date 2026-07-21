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

type deleteSelfDeviceRequest struct {
	FCMToken string `json:"fcm_token"`
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

// DeleteSelfDevice removes the caller's device. Preferred match is by
// (user_id, fcm_token) so a user with multiple devices only drops the one
// that made the call. When the client's FCM token has rotated since the
// register call, we fall back to deleting every device owned by the user —
// the caller is authoritatively leaving the org, so leftover FCM rows would
// only produce dead-token pushes.
//
// When the last device is removed, the user row is deleted too. Cascade drops
// the credentials, so the JWT the caller is holding becomes unusable on the
// next request (spec §4 Instant Session Invalidation).
func (h *API) DeleteSelfDevice(w http.ResponseWriter, r *http.Request) {
	user, ok := appmw.UserFromContext(r.Context())
	if !ok {
		fail(w, http.StatusUnauthorized, "unauthorized", "missing user context")
		return
	}

	var req deleteSelfDeviceRequest
	if err := decodeJSON(r, &req); err != nil {
		fail(w, http.StatusBadRequest, "bad_json", err.Error())
		return
	}
	req.FCMToken = strings.TrimSpace(req.FCMToken)

	err := h.DB.Transaction(func(tx *gorm.DB) error {
		q := tx.Where("user_id = ?", user.ID)
		if req.FCMToken != "" {
			// Try the specific-device path first.
			res := tx.Where("user_id = ? AND fcm_token = ?", user.ID, req.FCMToken).
				Delete(&models.Device{})
			if res.Error != nil {
				return res.Error
			}
			if res.RowsAffected == 0 {
				// FCM token rotated or never matched — drop all this user's devices.
				if err := q.Delete(&models.Device{}).Error; err != nil {
					return err
				}
			}
		} else {
			if err := q.Delete(&models.Device{}).Error; err != nil {
				return err
			}
		}

		var remaining int64
		if err := tx.Model(&models.Device{}).Where("user_id = ?", user.ID).Count(&remaining).Error; err != nil {
			return err
		}
		if remaining == 0 {
			if err := tx.Where("id = ?", user.ID).Delete(&models.User{}).Error; err != nil {
				return err
			}
		}
		return nil
	})
	if err != nil {
		slog.Error("delete self device", "err", err)
		fail(w, http.StatusInternalServerError, "db", "could not remove device")
		return
	}
	w.WriteHeader(http.StatusNoContent)
}
