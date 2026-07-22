// Package webauthn wraps go-webauthn with Hark's config / storage plumbing.
package webauthn

import (
	"encoding/base64"
	"encoding/hex"
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
	// Android's Credential Manager sends clientDataJSON.origin as
	// `android:apk-key-hash:<b64url_nopad(sha256_der)>` for the signing
	// cert — the same SHA-256 already declared in assetlinks.json. Derive
	// those origins from ANDROID_APP_LINKS so a valid DAL configuration
	// automatically permits the matching native ceremonies.
	origins := []string{cfg.PublicURL}
	for _, l := range cfg.AndroidAppLinks {
		o, err := androidAPKKeyHashOrigin(l.Fingerprint)
		if err != nil {
			return nil, fmt.Errorf("android origin for %q: %w", l.Package, err)
		}
		origins = append(origins, o)
	}
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

// androidAPKKeyHashOrigin builds the origin string that Credential Manager
// stamps into clientDataJSON for native ceremonies: `android:apk-key-hash:`
// followed by the base64url-nopad encoding of the signing cert's SHA-256
// fingerprint. Accepts the same colon-separated hex form assetlinks.json
// carries (`AA:BB:...`) as well as unseparated hex.
func androidAPKKeyHashOrigin(fingerprint string) (string, error) {
	hexStr := strings.ReplaceAll(strings.TrimSpace(fingerprint), ":", "")
	raw, err := hex.DecodeString(hexStr)
	if err != nil {
		return "", fmt.Errorf("decode fingerprint: %w", err)
	}
	if len(raw) != 32 {
		return "", fmt.Errorf("fingerprint must be 32 bytes, got %d", len(raw))
	}
	return "android:apk-key-hash:" + base64.RawURLEncoding.EncodeToString(raw), nil
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
