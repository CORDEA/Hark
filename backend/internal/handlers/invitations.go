package handlers

import (
	"errors"
	"log/slog"
	"net/http"
	"strings"
	"time"

	"github.com/go-chi/chi/v5"
	"gorm.io/gorm"

	"github.com/cordea/hark/internal/models"
	"github.com/cordea/hark/internal/services/invites"
)

// InvitationTTL is how long a freshly-minted invitation code remains valid.
// Short enough to keep unclaimed codes from lingering; long enough that an
// admin can hand off a QR in another room without racing a clock.
const InvitationTTL = 24 * time.Hour

const (
	invitationKindNewUser   = "new_user"
	invitationKindAddDevice = "add_device"
)

type createInvitationRequest struct {
	DisplayName string `json:"display_name"`
}

type createInvitationResponse struct {
	ID            uint      `json:"id"`
	Code          string    `json:"code"`
	DisplayName   string    `json:"display_name"`
	Kind          string    `json:"kind"`
	UniversalLink string    `json:"universal_link"`
	QRImage       string    `json:"qr_image"`
	ExpiresAt     time.Time `json:"expires_at"`
	ServerURL     string    `json:"server_url"`
	OrgName       string    `json:"org_name"`
}

// CreateInvitation mints a first-time-join invitation. The kind is derived
// from whether TargetUserID is set on the row (nil → new_user, present →
// add_device). This endpoint always mints new_user invitations; add-device
// invitations use a separate admin endpoint that carries the target user.
func (h *API) CreateInvitation(w http.ResponseWriter, r *http.Request) {
	var req createInvitationRequest
	if r.ContentLength > 0 {
		if err := decodeJSON(r, &req); err != nil {
			fail(w, http.StatusBadRequest, "bad_json", err.Error())
			return
		}
	}

	inv, err := h.mintInvitation(defaultName(req.DisplayName), nil)
	if err != nil {
		slog.Error("mint invitation", "err", err)
		fail(w, http.StatusInternalServerError, "db", "could not create invitation")
		return
	}

	created(w, h.buildInvitationResponse(inv))
}

// GetInvitation looks up an invitation by code and returns the pre-auth
// confirmation payload the mobile client uses to render "Join {org_name}?".
func (h *API) GetInvitation(w http.ResponseWriter, r *http.Request) {
	code := strings.TrimSpace(chi.URLParam(r, "code"))
	if code == "" {
		fail(w, http.StatusBadRequest, "missing_code", "invitation code required")
		return
	}

	var inv models.Invitation
	if err := h.DB.Where("code = ?", code).First(&inv).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			fail(w, http.StatusNotFound, "not_found", "invitation not found")
			return
		}
		slog.Error("get invitation", "err", err)
		fail(w, http.StatusInternalServerError, "db", "lookup failed")
		return
	}

	if inv.UsedAt != nil {
		fail(w, http.StatusGone, "used", "invitation has already been used")
		return
	}
	if time.Now().UTC().After(inv.ExpiresAt) {
		fail(w, http.StatusGone, "expired", "invitation has expired")
		return
	}

	ok(w, map[string]any{
		"code":         inv.Code,
		"display_name": inv.DisplayName,
		"kind":         invitationKind(inv),
		"expires_at":   inv.ExpiresAt,
		"org_name":     h.Config.OrgName,
		"server_url":   h.Config.PublicURL,
	})
}

// DeleteInvitation revokes an unused invitation. Admin-only in the router.
func (h *API) DeleteInvitation(w http.ResponseWriter, r *http.Request) {
	code := strings.TrimSpace(chi.URLParam(r, "code"))
	if code == "" {
		fail(w, http.StatusBadRequest, "missing_code", "invitation code required")
		return
	}
	res := h.DB.Where("code = ?", code).Delete(&models.Invitation{})
	if res.Error != nil {
		slog.Error("delete invitation", "err", res.Error)
		fail(w, http.StatusInternalServerError, "db", "could not delete invitation")
		return
	}
	if res.RowsAffected == 0 {
		fail(w, http.StatusNotFound, "not_found", "invitation not found")
		return
	}
	ok(w, map[string]string{"status": "deleted"})
}

// ListInvitations returns every open (unused, unexpired) invitation.
func (h *API) ListInvitations(w http.ResponseWriter, r *http.Request) {
	var rows []models.Invitation
	now := time.Now().UTC()
	if err := h.DB.
		Where("used_at IS NULL AND expires_at > ?", now).
		Order("created_at desc").
		Find(&rows).Error; err != nil {
		slog.Error("list invitations", "err", err)
		fail(w, http.StatusInternalServerError, "db", "could not list invitations")
		return
	}
	views := make([]createInvitationResponse, 0, len(rows))
	for _, inv := range rows {
		views = append(views, h.buildInvitationResponse(inv))
	}
	ok(w, views)
}

// mintInvitation persists an invitation with a fresh code, retrying on the
// astronomically rare code collision.
func (h *API) mintInvitation(displayName string, targetUserID *string) (models.Invitation, error) {
	now := time.Now().UTC()
	var inv models.Invitation
	for attempt := 0; attempt < 5; attempt++ {
		code, err := invites.NewCode()
		if err != nil {
			return models.Invitation{}, err
		}
		inv = models.Invitation{
			Code:         code,
			DisplayName:  displayName,
			TargetUserID: targetUserID,
			CreatedAt:    now,
			ExpiresAt:    now.Add(InvitationTTL),
		}
		err = h.DB.Create(&inv).Error
		if err == nil {
			return inv, nil
		}
		if !isUniqueViolation(err) {
			return models.Invitation{}, err
		}
	}
	return models.Invitation{}, errors.New("could not allocate unique invitation code")
}

func (h *API) buildInvitationResponse(inv models.Invitation) createInvitationResponse {
	link := invites.UniversalLink(h.Config.PublicURL, inv.Code)
	qr, err := invites.QRDataURL(link)
	if err != nil {
		slog.Warn("qr encode", "err", err, "code", inv.Code)
	}
	return createInvitationResponse{
		ID:            inv.ID,
		Code:          inv.Code,
		DisplayName:   inv.DisplayName,
		Kind:          invitationKind(inv),
		UniversalLink: link,
		QRImage:       qr,
		ExpiresAt:     inv.ExpiresAt,
		ServerURL:     h.Config.PublicURL,
		OrgName:       h.Config.OrgName,
	}
}

func invitationKind(inv models.Invitation) string {
	if inv.TargetUserID != nil {
		return invitationKindAddDevice
	}
	return invitationKindNewUser
}
