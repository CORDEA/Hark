package webauthn

import (
	"strings"

	"github.com/go-webauthn/webauthn/protocol"
	gowebauthn "github.com/go-webauthn/webauthn/webauthn"

	"github.com/cordea/hark/internal/models"
)

// User adapts a Hark user + their credential rows to the go-webauthn User
// interface. It's a snapshot value — callers build one per ceremony rather
// than caching it, because the underlying credential list can change between
// requests.
type User struct {
	Handle          []byte
	Name            string
	DisplayName     string
	CredentialsList []gowebauthn.Credential
}

func (u *User) WebAuthnID() []byte                           { return u.Handle }
func (u *User) WebAuthnName() string                         { return u.Name }
func (u *User) WebAuthnDisplayName() string                  { return u.DisplayName }
func (u *User) WebAuthnCredentials() []gowebauthn.Credential { return u.CredentialsList }

// NewUser builds a User whose handle is the raw bytes of the DB primary key.
// The primary key is a UUIDv4 string, which is 36 ASCII bytes — well under
// the 64-byte WebAuthn handle limit.
func NewUser(u models.User, creds []models.Credential) *User {
	wc := make([]gowebauthn.Credential, 0, len(creds))
	for _, c := range creds {
		wc = append(wc, ToLibraryCredential(c))
	}
	name := u.DisplayName
	if name == "" {
		name = u.ID
	}
	return &User{
		Handle:          []byte(u.ID),
		Name:            name,
		DisplayName:     name,
		CredentialsList: wc,
	}
}

// NewProspectiveUser builds a placeholder User with no credentials for a
// first-time-join ceremony where the users row doesn't exist yet. The
// handle is a fresh random UUID (as bytes) that the caller has minted and
// will later persist as users.id.
func NewProspectiveUser(handle []byte, displayName string) *User {
	name := displayName
	if name == "" {
		name = "Subscriber"
	}
	return &User{
		Handle:          handle,
		Name:            name,
		DisplayName:     name,
		CredentialsList: nil,
	}
}

// ToLibraryCredential converts a stored Credential row into the shape
// go-webauthn expects when re-verifying an assertion.
func ToLibraryCredential(c models.Credential) gowebauthn.Credential {
	return gowebauthn.Credential{
		ID:              c.CredentialID,
		PublicKey:       c.PublicKey,
		AttestationType: c.AttestationType,
		Transport:       transportsFromCSV(c.Transports),
		Authenticator: gowebauthn.Authenticator{
			AAGUID:    c.AAGUID,
			SignCount: c.SignCount,
		},
	}
}

// TransportsToCSV serialises the library's transport list to the CSV form
// stored on Credential.Transports.
func TransportsToCSV(ts []protocol.AuthenticatorTransport) string {
	if len(ts) == 0 {
		return ""
	}
	parts := make([]string, 0, len(ts))
	for _, t := range ts {
		s := strings.TrimSpace(string(t))
		if s != "" {
			parts = append(parts, s)
		}
	}
	return strings.Join(parts, ",")
}

func transportsFromCSV(csv string) []protocol.AuthenticatorTransport {
	csv = strings.TrimSpace(csv)
	if csv == "" {
		return nil
	}
	raw := strings.Split(csv, ",")
	out := make([]protocol.AuthenticatorTransport, 0, len(raw))
	for _, p := range raw {
		p = strings.TrimSpace(p)
		if p != "" {
			out = append(out, protocol.AuthenticatorTransport(p))
		}
	}
	return out
}
