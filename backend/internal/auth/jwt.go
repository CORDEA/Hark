// Package auth issues and verifies the long-lived JWTs handed to clients
// after a successful WebAuthn ceremony.
package auth

import (
	"crypto/rand"
	"encoding/base64"
	"errors"
	"fmt"
	"time"

	"github.com/golang-jwt/jwt/v5"
)

// TokenLifetime matches spec §3.1: long-lived tokens whose revocation is
// driven by user deletion (cascade delete → next call's user-lookup fails).
const TokenLifetime = 365 * 24 * time.Hour

// SigningKeyBytes is the length of the random HS256 key stored in
// server_meta on first boot.
const SigningKeyBytes = 32

// Claims are the payload of a Hark auth JWT.
type Claims struct {
	CredentialID string `json:"cred,omitempty"`
	jwt.RegisteredClaims
}

// Signer signs and verifies JWTs for one Hark server instance.
type Signer struct {
	key    []byte
	issuer string
}

// NewSigner constructs a Signer bound to the given key and issuer.
func NewSigner(key []byte, issuer string) *Signer {
	return &Signer{key: key, issuer: issuer}
}

// GenerateSigningKey returns a fresh random HS256 key.
func GenerateSigningKey() ([]byte, error) {
	buf := make([]byte, SigningKeyBytes)
	if _, err := rand.Read(buf); err != nil {
		return nil, fmt.Errorf("read random: %w", err)
	}
	return buf, nil
}

// Sign mints a token for the given user. credentialID is stored as a hint
// so future revocation-per-credential logic can be added without a claims
// migration.
func (s *Signer) Sign(userID string, credentialID []byte) (string, time.Time, error) {
	now := time.Now().UTC()
	exp := now.Add(TokenLifetime)
	claims := Claims{
		CredentialID: base64.RawURLEncoding.EncodeToString(credentialID),
		RegisteredClaims: jwt.RegisteredClaims{
			Subject:   userID,
			IssuedAt:  jwt.NewNumericDate(now),
			ExpiresAt: jwt.NewNumericDate(exp),
			Issuer:    s.issuer,
		},
	}
	tok := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	signed, err := tok.SignedString(s.key)
	if err != nil {
		return "", time.Time{}, fmt.Errorf("sign token: %w", err)
	}
	return signed, exp, nil
}

// Parse verifies the token signature/expiry/issuer and returns its claims.
func (s *Signer) Parse(raw string) (*Claims, error) {
	claims := &Claims{}
	_, err := jwt.ParseWithClaims(raw, claims, func(t *jwt.Token) (any, error) {
		if _, ok := t.Method.(*jwt.SigningMethodHMAC); !ok {
			return nil, fmt.Errorf("unexpected signing method: %v", t.Method.Alg())
		}
		return s.key, nil
	}, jwt.WithIssuer(s.issuer), jwt.WithValidMethods([]string{jwt.SigningMethodHS256.Alg()}))
	if err != nil {
		return nil, err
	}
	if claims.Subject == "" {
		return nil, errors.New("token missing sub claim")
	}
	return claims, nil
}
