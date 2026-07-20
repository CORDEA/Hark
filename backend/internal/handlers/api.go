package handlers

import (
	gowebauthn "github.com/go-webauthn/webauthn/webauthn"
	"gorm.io/gorm"

	"github.com/cordea/hark/internal/auth"
	"github.com/cordea/hark/internal/config"
	"github.com/cordea/hark/internal/services/alerts"
)

// API is the receiver for HTTP handlers, holding the dependencies that were
// previously plumbed through package-level state.
type API struct {
	DB     *gorm.DB
	Config config.Config
	Alerts *alerts.Service
	RP     *gowebauthn.WebAuthn
	Signer *auth.Signer
}
