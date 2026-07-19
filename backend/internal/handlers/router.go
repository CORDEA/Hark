package handlers

import (
	"io/fs"
	"net/http"

	"github.com/go-chi/chi/v5"
	"gorm.io/gorm"

	"github.com/cordea/hark/internal/config"
	appmw "github.com/cordea/hark/internal/middleware"
	"github.com/cordea/hark/internal/services/alerts"
)

type Deps struct {
	DB     *gorm.DB
	Config config.Config
	Web    fs.FS
	Alerts *alerts.Service
}

func NewRouter(d Deps) http.Handler {
	api := &API{DB: d.DB, Config: d.Config, Alerts: d.Alerts}

	r := chi.NewRouter()
	for _, mw := range appmw.Chain() {
		r.Use(mw)
	}

	r.Route("/api", func(r chi.Router) {
		r.Get("/health", Health)
		r.Get("/stats", api.Stats)
		r.Get("/users", api.ListUsers)
		r.Post("/invite", api.Invite)
		r.Post("/register", api.Register)
		r.Post("/users/leave", api.Leave)
		r.Post("/users/{id}/test-ping", api.TestPing)
		r.Post("/users/{id}/reinvite", api.Reinvite)
		r.Delete("/users/{id}", api.KickUser)

		r.Get("/alerts", api.ListAlerts)
		r.Get("/alerts/{id}", api.GetAlert)
		r.Post("/alerts/trigger", api.TriggerAlert)
		r.Post("/alerts/{id}/respond", api.RespondAlert)
		r.Post("/alerts/{id}/resolve-admin", api.ResolveAlertAdmin)
	})

	r.Handle("/*", http.FileServer(http.FS(d.Web)))

	return r
}
