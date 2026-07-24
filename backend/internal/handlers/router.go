package handlers

import (
	"io/fs"
	"net/http"

	"github.com/go-chi/chi/v5"
	gowebauthn "github.com/go-webauthn/webauthn/webauthn"
	"gorm.io/gorm"

	"github.com/cordea/hark/internal/auth"
	"github.com/cordea/hark/internal/config"
	appmw "github.com/cordea/hark/internal/middleware"
	"github.com/cordea/hark/internal/services/alerts"
)

type Deps struct {
	DB     *gorm.DB
	Config config.Config
	Web    fs.FS
	Alerts *alerts.Service
	RP     *gowebauthn.WebAuthn
	Signer *auth.Signer
}

func NewRouter(d Deps) http.Handler {
	api := &API{
		DB:     d.DB,
		Config: d.Config,
		Alerts: d.Alerts,
		RP:     d.RP,
		Signer: d.Signer,
	}

	r := chi.NewRouter()
	for _, mw := range appmw.Chain() {
		r.Use(mw)
	}

	r.Route("/api", func(r chi.Router) {
		r.Get("/health", Health)
		r.Get("/stats", api.Stats)
		r.Get("/users", api.ListUsers)
		r.Get("/alert-types", api.ListAlertTypes)

		// Passkey-era invitation endpoints. Admin-only enforcement is
		// delegated to the reverse proxy, matching the existing model.
		r.Post("/invitations", api.CreateInvitation)
		r.Get("/invitations", api.ListInvitations)
		r.Get("/invitations/{code}", api.GetInvitation)
		r.Delete("/invitations/{code}", api.DeleteInvitation)

		// WebAuthn ceremony endpoints. Both /begin and /finish are
		// unauthenticated — register uses the invitation code as its
		// authorization; assertion is a discoverable-credential ceremony
		// that resolves the user from the signed assertion itself.
		r.Post("/webauthn/register/begin", api.RegisterBegin)
		r.Post("/webauthn/register/finish", api.RegisterFinish)
		r.Post("/webauthn/assertion/begin", api.AssertionBegin)
		r.Post("/webauthn/assertion/finish", api.AssertionFinish)

		// JWT-guarded endpoints: caller identity is resolved from the token,
		// never from the body.
		r.Group(func(r chi.Router) {
			r.Use(appmw.JWT(d.DB, d.Signer))
			r.Post("/devices", api.RegisterDevice)
			r.Delete("/devices/self", api.DeleteSelfDevice)
			r.Delete("/self", api.DeleteSelf)
			r.Get("/me", api.Me)
			r.Post("/alerts/{id}/respond", api.RespondAlert)
		})

		r.Post("/users/{id}/test-ping", api.TestPing)
		r.Post("/users/{id}/add-device-invitations", api.CreateAddDeviceInvitation)
		r.Delete("/users/{id}/devices/{deviceId}", api.AdminDeleteDevice)
		r.Delete("/users/{id}", api.KickUser)

		// Read endpoints are shared with the admin dashboard, which relies on
		// reverse-proxy auth. OptionalJWT enriches responses with per-caller
		// context (e.g. is_recipient) when the mobile client passes a Bearer
		// token, and stays transparent when it doesn't.
		r.Group(func(r chi.Router) {
			r.Use(appmw.OptionalJWT(d.DB, d.Signer))
			r.Get("/alerts", api.ListAlerts)
			r.Get("/alerts/{id}", api.GetAlert)
		})
		r.Post("/alerts/trigger", api.TriggerAlert)
		r.Post("/alerts/{id}/resolve-admin", api.ResolveAlertAdmin)
		r.Post("/alerts/{id}/remind-admin", api.RemindAlertAdmin)
	})

	// Well-known + universal-link landing page. Public, no auth.
	r.Get("/.well-known/apple-app-site-association", api.AppleAppSiteAssociation)
	r.Get("/.well-known/assetlinks.json", api.AndroidAssetLinks)
	r.Get("/join", api.JoinFallback)

	r.Handle("/*", http.FileServer(http.FS(d.Web)))

	return r
}
