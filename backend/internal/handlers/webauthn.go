package handlers

import (
	"bytes"
	"encoding/json"
	"errors"
	"io"
	"log/slog"
	"net/http"
	"strings"
	"time"

	"github.com/google/uuid"
	"gorm.io/gorm"

	gowebauthn "github.com/go-webauthn/webauthn/webauthn"

	"github.com/cordea/hark/internal/models"
	wapkg "github.com/cordea/hark/internal/webauthn"
)

// ChallengeTTL matches plan §3.4: challenges live ~5 min.
const ChallengeTTL = 5 * time.Minute

type registerBeginRequest struct {
	InvitationCode string `json:"invitation_code"`
	DisplayName    string `json:"display_name"`
}

type registerFinishRequest struct {
	InvitationCode string          `json:"invitation_code"`
	Attestation    json.RawMessage `json:"attestation"`
}

type registerFinishResponse struct {
	UserID         string    `json:"user_id"`
	AuthToken      string    `json:"auth_token"`
	TokenExpiresAt time.Time `json:"token_expires_at"`
}

// RegisterBegin issues a WebAuthn credential creation options blob keyed to
// the invitation code. new_user invitations mint a fresh user handle that
// will become users.id on finish; add_device invitations reuse the target
// user's existing handle (M5).
func (h *API) RegisterBegin(w http.ResponseWriter, r *http.Request) {
	var req registerBeginRequest
	if err := decodeJSON(r, &req); err != nil {
		fail(w, http.StatusBadRequest, "bad_json", err.Error())
		return
	}
	req.InvitationCode = strings.TrimSpace(req.InvitationCode)
	if req.InvitationCode == "" {
		fail(w, http.StatusBadRequest, "missing_fields", "invitation_code required")
		return
	}

	inv, apiErr := h.loadOpenInvitation(req.InvitationCode)
	if apiErr != nil {
		apiErr.write(w)
		return
	}

	if inv.TargetUserID != nil {
		// add_device flow lands in M5.
		fail(w, http.StatusNotImplemented, "not_implemented", "add-device invitations are not yet supported")
		return
	}

	displayName := firstNonEmpty(req.DisplayName, inv.DisplayName, "Subscriber")
	handle := []byte(uuid.NewString())
	user := wapkg.NewProspectiveUser(handle, displayName)

	creation, session, err := h.RP.BeginRegistration(user)
	if err != nil {
		slog.Error("webauthn begin registration", "err", err)
		fail(w, http.StatusInternalServerError, "webauthn", err.Error())
		return
	}

	sessionJSON, err := json.Marshal(session)
	if err != nil {
		slog.Error("marshal session", "err", err)
		fail(w, http.StatusInternalServerError, "webauthn", "could not persist ceremony state")
		return
	}

	code := req.InvitationCode
	handleStr := string(handle)
	now := time.Now().UTC()
	// One outstanding challenge per invitation — replacing here also
	// invalidates any prior /begin call that hasn't finished.
	if err := h.DB.Where("invitation_code = ? AND purpose = ?", code, models.WebAuthnPurposeRegister).
		Delete(&models.WebAuthnChallenge{}).Error; err != nil {
		slog.Warn("purge stale challenges", "err", err)
	}
	ch := models.WebAuthnChallenge{
		Challenge:      []byte(session.Challenge),
		Purpose:        models.WebAuthnPurposeRegister,
		InvitationCode: &code,
		UserID:         &handleStr,
		SessionData:    sessionJSON,
		CreatedAt:      now,
		ExpiresAt:      now.Add(ChallengeTTL),
	}
	if err := h.DB.Create(&ch).Error; err != nil {
		slog.Error("persist challenge", "err", err)
		fail(w, http.StatusInternalServerError, "db", "could not persist challenge")
		return
	}

	ok(w, creation)
}

// RegisterFinish verifies the attestation, creates the user + credential
// rows, marks the invitation used, and mints the long-lived JWT.
func (h *API) RegisterFinish(w http.ResponseWriter, r *http.Request) {
	// Consume the body once — we need it both to lift the invitation code
	// out and to hand the attestation portion to go-webauthn as a fresh
	// request body.
	raw, err := io.ReadAll(r.Body)
	if err != nil {
		fail(w, http.StatusBadRequest, "bad_body", err.Error())
		return
	}
	var req registerFinishRequest
	if err := json.Unmarshal(raw, &req); err != nil {
		fail(w, http.StatusBadRequest, "bad_json", err.Error())
		return
	}
	req.InvitationCode = strings.TrimSpace(req.InvitationCode)
	if req.InvitationCode == "" || len(req.Attestation) == 0 {
		fail(w, http.StatusBadRequest, "missing_fields", "invitation_code and attestation are required")
		return
	}

	inv, apiErr := h.loadOpenInvitation(req.InvitationCode)
	if apiErr != nil {
		apiErr.write(w)
		return
	}
	if inv.TargetUserID != nil {
		fail(w, http.StatusNotImplemented, "not_implemented", "add-device invitations are not yet supported")
		return
	}

	var ch models.WebAuthnChallenge
	if err := h.DB.
		Where("invitation_code = ? AND purpose = ?", req.InvitationCode, models.WebAuthnPurposeRegister).
		First(&ch).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			fail(w, http.StatusBadRequest, "no_challenge", "no active challenge for invitation")
			return
		}
		slog.Error("load challenge", "err", err)
		fail(w, http.StatusInternalServerError, "db", "lookup failed")
		return
	}
	if time.Now().UTC().After(ch.ExpiresAt) {
		_ = h.DB.Delete(&ch).Error
		fail(w, http.StatusGone, "challenge_expired", "challenge has expired")
		return
	}
	if ch.UserID == nil {
		fail(w, http.StatusInternalServerError, "challenge_state", "challenge missing user handle")
		return
	}

	var session gowebauthn.SessionData
	if err := json.Unmarshal(ch.SessionData, &session); err != nil {
		slog.Error("unmarshal session", "err", err)
		fail(w, http.StatusInternalServerError, "webauthn", "corrupt ceremony state")
		return
	}

	handle := []byte(*ch.UserID)
	user := wapkg.NewProspectiveUser(handle, firstNonEmpty(inv.DisplayName, "Subscriber"))

	// go-webauthn's FinishRegistration expects a *http.Request whose body
	// is the raw attestation JSON. Reconstruct one from the extracted blob.
	attReq, err := http.NewRequestWithContext(r.Context(), http.MethodPost, "/webauthn/register/finish", bytes.NewReader(req.Attestation))
	if err != nil {
		slog.Error("build attestation request", "err", err)
		fail(w, http.StatusInternalServerError, "internal", err.Error())
		return
	}
	attReq.Header.Set("Content-Type", "application/json")

	credential, err := h.RP.FinishRegistration(user, session, attReq)
	if err != nil {
		slog.Warn("webauthn finish registration", "err", err)
		fail(w, http.StatusBadRequest, "verification_failed", err.Error())
		return
	}

	userID := *ch.UserID
	displayName := firstNonEmpty(inv.DisplayName, "Subscriber")
	now := time.Now().UTC()

	err = h.DB.Transaction(func(tx *gorm.DB) error {
		userRow := models.User{
			ID:          userID,
			DisplayName: displayName,
			CreatedAt:   now,
		}
		if err := tx.Create(&userRow).Error; err != nil {
			return err
		}
		credRow := models.Credential{
			UserID:          userID,
			CredentialID:    credential.ID,
			PublicKey:       credential.PublicKey,
			SignCount:       credential.Authenticator.SignCount,
			AAGUID:          credential.Authenticator.AAGUID,
			Transports:      wapkg.TransportsToCSV(credential.Transport),
			AttestationType: credential.AttestationType,
			CreatedAt:       now,
		}
		if err := tx.Create(&credRow).Error; err != nil {
			return err
		}
		usedBy := userID
		if err := tx.Model(&models.Invitation{}).
			Where("id = ? AND used_at IS NULL", inv.ID).
			Updates(map[string]any{
				"used_at":         now,
				"used_by_user_id": usedBy,
			}).Error; err != nil {
			return err
		}
		if err := tx.Where("id = ?", ch.ID).Delete(&models.WebAuthnChallenge{}).Error; err != nil {
			return err
		}
		return nil
	})
	if err != nil {
		slog.Error("persist registration", "err", err)
		fail(w, http.StatusInternalServerError, "db", "could not persist registration")
		return
	}

	token, exp, err := h.Signer.Sign(userID, credential.ID)
	if err != nil {
		slog.Error("mint token", "err", err)
		fail(w, http.StatusInternalServerError, "auth", "could not mint token")
		return
	}

	created(w, registerFinishResponse{
		UserID:         userID,
		AuthToken:      token,
		TokenExpiresAt: exp,
	})
}

// apiError is a small helper so validation branches in register handlers
// can bail with a single write call.
type apiError struct {
	Status  int
	Code    string
	Message string
}

func (e *apiError) write(w http.ResponseWriter) {
	fail(w, e.Status, e.Code, e.Message)
}

func (h *API) loadOpenInvitation(code string) (models.Invitation, *apiError) {
	var inv models.Invitation
	if err := h.DB.Where("code = ?", code).First(&inv).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return inv, &apiError{Status: http.StatusNotFound, Code: "not_found", Message: "invitation not found"}
		}
		slog.Error("load invitation", "err", err)
		return inv, &apiError{Status: http.StatusInternalServerError, Code: "db", Message: "lookup failed"}
	}
	if inv.UsedAt != nil {
		return inv, &apiError{Status: http.StatusGone, Code: "used", Message: "invitation has already been used"}
	}
	if time.Now().UTC().After(inv.ExpiresAt) {
		return inv, &apiError{Status: http.StatusGone, Code: "expired", Message: "invitation has expired"}
	}
	return inv, nil
}

func firstNonEmpty(values ...string) string {
	for _, v := range values {
		v = strings.TrimSpace(v)
		if v != "" {
			return v
		}
	}
	return ""
}
