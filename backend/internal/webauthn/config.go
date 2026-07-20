// Package webauthn wraps go-webauthn with Hark's config / storage plumbing.
package webauthn

import (
	"fmt"
	"net/url"
	"strings"

	"github.com/go-webauthn/webauthn/protocol"
	gowebauthn "github.com/go-webauthn/webauthn/webauthn"

	"github.com/cordea/hark/internal/config"
	"github.com/cordea/hark/internal/models"
)

// BuildRP constructs the go-webauthn RP handle from static config and the
// per-server ServerMeta row. Defaults follow plan §3.4: attestation=none,
// user verification required, resident key required.
func BuildRP(cfg config.Config, meta models.ServerMeta) (*gowebauthn.WebAuthn, error) {
	origins := []string{cfg.PublicURL}
	// TODO(passkey): honor EXTRA_ORIGINS env once we introduce it in config.
	wcfg := &gowebauthn.Config{
		RPID:                  meta.RPID,
		RPDisplayName:         cfg.OrgName,
		RPOrigins:             origins,
		AttestationPreference: protocol.PreferNoAttestation,
		AuthenticatorSelection: protocol.AuthenticatorSelection{
			ResidentKey:      protocol.ResidentKeyRequirementRequired,
			UserVerification: protocol.VerificationRequired,
		},
		// EncodeUserIDAsString keeps the WebAuthn user handle as a raw
		// UTF-8 UUID string on the wire, matching what the Corbado
		// `passkeys` Flutter plugin (and the ASAuthorization / Credential
		// Manager platform APIs it wraps) expect.
		EncodeUserIDAsString: true,
	}
	w, err := gowebauthn.New(wcfg)
	if err != nil {
		return nil, fmt.Errorf("webauthn new: %w", err)
	}
	return w, nil
}

// HostFromURL returns the hostname portion of a URL string. Used both to
// seed ServerMeta.RPID and to detect PUBLIC_URL drift at boot.
func HostFromURL(raw string) (string, error) {
	raw = strings.TrimSpace(raw)
	if raw == "" {
		return "", fmt.Errorf("empty url")
	}
	u, err := url.Parse(raw)
	if err != nil {
		return "", fmt.Errorf("parse url: %w", err)
	}
	host := u.Hostname()
	if host == "" {
		return "", fmt.Errorf("url has no host: %s", raw)
	}
	return host, nil
}
