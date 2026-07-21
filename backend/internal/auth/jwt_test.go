package auth

import (
	"bytes"
	"testing"
	"time"

	"github.com/golang-jwt/jwt/v5"
)

func TestSignParseRoundtrip(t *testing.T) {
	signer := NewSigner(bytes.Repeat([]byte{0x42}, SigningKeyBytes), "https://hark.test")
	credID := []byte("cred-1")
	token, exp, err := signer.Sign("user-1", credID)
	if err != nil {
		t.Fatalf("sign: %v", err)
	}
	if exp.Sub(time.Now().UTC()) < 300*24*time.Hour {
		t.Fatalf("token expires too soon: %s", exp)
	}
	claims, err := signer.Parse(token)
	if err != nil {
		t.Fatalf("parse: %v", err)
	}
	if claims.Subject != "user-1" {
		t.Fatalf("sub = %q", claims.Subject)
	}
	if claims.CredentialID == "" {
		t.Fatalf("cred claim missing")
	}
}

func TestParseRejectsDifferentKey(t *testing.T) {
	a := NewSigner(bytes.Repeat([]byte{0x01}, SigningKeyBytes), "https://hark.test")
	b := NewSigner(bytes.Repeat([]byte{0x02}, SigningKeyBytes), "https://hark.test")
	token, _, err := a.Sign("user-1", []byte("cred"))
	if err != nil {
		t.Fatalf("sign: %v", err)
	}
	if _, err := b.Parse(token); err == nil {
		t.Fatalf("parse with wrong key should have failed")
	}
}

func TestParseRejectsWrongIssuer(t *testing.T) {
	a := NewSigner(bytes.Repeat([]byte{0x33}, SigningKeyBytes), "https://a.example.com")
	b := NewSigner(bytes.Repeat([]byte{0x33}, SigningKeyBytes), "https://b.example.com")
	token, _, err := a.Sign("user-1", []byte("cred"))
	if err != nil {
		t.Fatalf("sign: %v", err)
	}
	_, err = b.Parse(token)
	if err == nil {
		t.Fatalf("parse with wrong issuer should have failed")
	}
	if !jwtValidationErr(err) {
		t.Fatalf("expected token validation error, got %v", err)
	}
}

func jwtValidationErr(err error) bool {
	// jwt/v5 wraps issuer-mismatch as a validation error.
	if err == nil {
		return false
	}
	return contains(err.Error(), "iss")
}

func contains(s, sub string) bool {
	for i := 0; i+len(sub) <= len(s); i++ {
		if s[i:i+len(sub)] == sub {
			return true
		}
	}
	return false
}

// keep the jwt import used even if the helper above shrinks later.
var _ = jwt.SigningMethodHS256
