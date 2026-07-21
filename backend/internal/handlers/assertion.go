package handlers

import (
	"bytes"
	"encoding/json"
	"errors"
	"io"
	"log/slog"
	"net/http"
	"time"

	"gorm.io/gorm"

	gowebauthn "github.com/go-webauthn/webauthn/webauthn"

	"github.com/cordea/hark/internal/models"
	wapkg "github.com/cordea/hark/internal/webauthn"
)

type assertionFinishRequest struct {
	// Challenge is the base64url-encoded challenge from /begin. Sent by the
	// client so the server can pair the finish request with the challenge
	// row (assertion has no invitation code as an alternative key).
	Challenge string          `json:"challenge"`
	Assertion json.RawMessage `json:"assertion"`
}

type assertionFinishResponse struct {
	UserID         string    `json:"user_id"`
	AuthToken      string    `json:"auth_token"`
	TokenExpiresAt time.Time `json:"token_expires_at"`
}

// AssertionBegin returns the discoverable-credential PublicKeyCredentialRequestOptions.
// No invitation is required — the client-side authenticator picks the credential
// that matches the RP ID and hands us its user handle at /finish.
func (h *API) AssertionBegin(w http.ResponseWriter, r *http.Request) {
	assertion, session, err := h.RP.BeginDiscoverableLogin()
	if err != nil {
		slog.Error("webauthn begin discoverable login", "err", err)
		fail(w, http.StatusInternalServerError, "webauthn", err.Error())
		return
	}

	sessionJSON, err := json.Marshal(session)
	if err != nil {
		slog.Error("marshal assertion session", "err", err)
		fail(w, http.StatusInternalServerError, "webauthn", "could not persist ceremony state")
		return
	}

	now := time.Now().UTC()
	ch := models.WebAuthnChallenge{
		Challenge:   []byte(session.Challenge),
		Purpose:     models.WebAuthnPurposeAssert,
		SessionData: sessionJSON,
		CreatedAt:   now,
		ExpiresAt:   now.Add(ChallengeTTL),
	}
	if err := h.DB.Create(&ch).Error; err != nil {
		slog.Error("persist assertion challenge", "err", err)
		fail(w, http.StatusInternalServerError, "db", "could not persist challenge")
		return
	}

	ok(w, assertion)
}

// AssertionFinish verifies the discoverable-credential assertion, bumps the
// stored sign_count / last_used_at on the credential row, and mints a fresh
// JWT for the resolved user. Sign-count regressions on non-zero counters
// signal a cloned authenticator — refuse rather than roll forward.
func (h *API) AssertionFinish(w http.ResponseWriter, r *http.Request) {
	raw, err := io.ReadAll(r.Body)
	if err != nil {
		fail(w, http.StatusBadRequest, "bad_body", err.Error())
		return
	}
	var req assertionFinishRequest
	if err := json.Unmarshal(raw, &req); err != nil {
		fail(w, http.StatusBadRequest, "bad_json", err.Error())
		return
	}
	if req.Challenge == "" || len(req.Assertion) == 0 {
		fail(w, http.StatusBadRequest, "missing_fields", "challenge and assertion are required")
		return
	}

	var ch models.WebAuthnChallenge
	if err := h.DB.
		Where("challenge = ? AND purpose = ?", []byte(req.Challenge), models.WebAuthnPurposeAssert).
		First(&ch).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			fail(w, http.StatusBadRequest, "no_challenge", "no active challenge")
			return
		}
		slog.Error("load assertion challenge", "err", err)
		fail(w, http.StatusInternalServerError, "db", "lookup failed")
		return
	}
	if time.Now().UTC().After(ch.ExpiresAt) {
		_ = h.DB.Delete(&ch).Error
		fail(w, http.StatusGone, "challenge_expired", "challenge has expired")
		return
	}

	var session gowebauthn.SessionData
	if err := json.Unmarshal(ch.SessionData, &session); err != nil {
		slog.Error("unmarshal assertion session", "err", err)
		fail(w, http.StatusInternalServerError, "webauthn", "corrupt ceremony state")
		return
	}

	// Discoverable-login uses a user handler that resolves the caller from
	// the credential id + user handle returned in the assertion. Closure
	// captures the resolved *wapkg.User so we can look up the stored
	// credential row afterwards to update sign_count.
	var (
		resolvedUser *models.User
		resolvedCred *models.Credential
	)
	handler := func(rawID, userHandle []byte) (gowebauthn.User, error) {
		var cred models.Credential
		if err := h.DB.Where("credential_id = ?", rawID).First(&cred).Error; err != nil {
			if errors.Is(err, gorm.ErrRecordNotFound) {
				return nil, errors.New("credential not registered")
			}
			return nil, err
		}
		var user models.User
		if err := h.DB.First(&user, "id = ?", cred.UserID).Error; err != nil {
			return nil, err
		}
		if len(userHandle) > 0 && string(userHandle) != user.ID {
			return nil, errors.New("user handle mismatch")
		}
		var creds []models.Credential
		if err := h.DB.Where("user_id = ?", user.ID).Find(&creds).Error; err != nil {
			return nil, err
		}
		resolvedUser = &user
		resolvedCred = &cred
		return wapkg.NewUser(user, creds), nil
	}

	// go-webauthn wants the assertion as an *http.Request body — same trick
	// as register/finish.
	assReq, err := http.NewRequestWithContext(r.Context(), http.MethodPost, "/webauthn/assertion/finish", bytes.NewReader(req.Assertion))
	if err != nil {
		slog.Error("build assertion request", "err", err)
		fail(w, http.StatusInternalServerError, "internal", err.Error())
		return
	}
	assReq.Header.Set("Content-Type", "application/json")

	credential, err := h.RP.FinishDiscoverableLogin(handler, session, assReq)
	if err != nil {
		slog.Warn("webauthn finish discoverable login", "err", err)
		fail(w, http.StatusBadRequest, "verification_failed", err.Error())
		return
	}
	if resolvedUser == nil || resolvedCred == nil {
		// Should be unreachable — handler must have run for FinishDiscoverableLogin to succeed.
		fail(w, http.StatusInternalServerError, "internal", "unresolved credential")
		return
	}
	if credential.Authenticator.CloneWarning {
		slog.Warn("clone warning on assertion", "user_id", resolvedUser.ID, "credential_id", resolvedCred.ID)
	}
	if resolvedCred.SignCount > 0 && credential.Authenticator.SignCount <= resolvedCred.SignCount {
		// Non-monotonic sign counter — refuse (spec §3.4 sign-count rule).
		fail(w, http.StatusBadRequest, "counter_regressed", "authenticator sign counter regressed")
		return
	}

	now := time.Now().UTC()
	err = h.DB.Transaction(func(tx *gorm.DB) error {
		if err := tx.Model(&models.Credential{}).
			Where("id = ?", resolvedCred.ID).
			Updates(map[string]any{
				"sign_count":   credential.Authenticator.SignCount,
				"last_used_at": now,
			}).Error; err != nil {
			return err
		}
		return tx.Where("id = ?", ch.ID).Delete(&models.WebAuthnChallenge{}).Error
	})
	if err != nil {
		slog.Error("persist assertion", "err", err)
		fail(w, http.StatusInternalServerError, "db", "could not persist assertion")
		return
	}

	token, exp, err := h.Signer.Sign(resolvedUser.ID, credential.ID)
	if err != nil {
		slog.Error("mint token", "err", err)
		fail(w, http.StatusInternalServerError, "auth", "could not mint token")
		return
	}
	ok(w, assertionFinishResponse{
		UserID:         resolvedUser.ID,
		AuthToken:      token,
		TokenExpiresAt: exp,
	})
}
