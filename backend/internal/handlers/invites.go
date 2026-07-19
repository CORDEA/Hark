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
	"github.com/cordea/hark/internal/services/invites"
)

type inviteRequest struct {
	DisplayName string `json:"display_name"`
}

type inviteResponse struct {
	UserID         string `json:"user_id"`
	DisplayName    string `json:"display_name"`
	InvitationCode string `json:"invitation_code"`
	DeepLink       string `json:"deep_link"`
	QRPayload      string `json:"qr_payload"`
	QRImage        string `json:"qr_image"`
}

func (h *API) Invite(w http.ResponseWriter, r *http.Request) {
	var req inviteRequest
	if r.ContentLength > 0 {
		if err := decodeJSON(r, &req); err != nil {
			fail(w, http.StatusBadRequest, "bad_json", err.Error())
			return
		}
	}

	// Retry on the astronomically rare code collision.
	var user models.User
	for attempt := 0; attempt < 5; attempt++ {
		code, err := invites.NewCode()
		if err != nil {
			fail(w, http.StatusInternalServerError, "code_gen", err.Error())
			return
		}
		user = models.User{
			ID:             uuid.NewString(),
			DisplayName:    defaultName(req.DisplayName),
			InvitationCode: code,
			Status:         models.UserStatusInvited,
			CreatedAt:      time.Now().UTC(),
		}
		err = h.DB.Create(&user).Error
		if err == nil {
			break
		}
		if !isUniqueViolation(err) {
			slog.Error("create user", "err", err)
			fail(w, http.StatusInternalServerError, "db", "could not create user")
			return
		}
		user.InvitationCode = ""
	}
	if user.InvitationCode == "" {
		fail(w, http.StatusInternalServerError, "code_gen", "could not allocate unique code")
		return
	}

	deepLink := invites.DeepLink(h.Config.PublicURL, user.InvitationCode)
	qrImage, err := invites.QRDataURL(deepLink)
	if err != nil {
		slog.Error("qr encode", "err", err)
		fail(w, http.StatusInternalServerError, "qr_encode", err.Error())
		return
	}

	created(w, inviteResponse{
		UserID:         user.ID,
		DisplayName:    user.DisplayName,
		InvitationCode: user.InvitationCode,
		DeepLink:       deepLink,
		QRPayload:      deepLink,
		QRImage:        qrImage,
	})
}

func defaultName(name string) string {
	name = strings.TrimSpace(name)
	if name == "" {
		return "Subscriber"
	}
	return name
}

// isUniqueViolation reports whether err looks like a unique-constraint failure.
// GORM does not expose a portable sentinel; the message check covers both
// SQLite ("UNIQUE constraint failed") and Postgres ("duplicate key value
// violates unique constraint").
func isUniqueViolation(err error) bool {
	if err == nil || errors.Is(err, gorm.ErrRecordNotFound) {
		return false
	}
	return strings.Contains(strings.ToLower(err.Error()), "unique") ||
		strings.Contains(strings.ToLower(err.Error()), "duplicate key")
}
