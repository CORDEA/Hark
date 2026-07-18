package handlers

import (
	"io/fs"
	"net/http"

	"github.com/go-chi/chi/v5"
	"gorm.io/gorm"

	"github.com/cordea/hark/internal/config"
	appmw "github.com/cordea/hark/internal/middleware"
)

type Deps struct {
	DB     *gorm.DB
	Config config.Config
	Web    fs.FS
}

func NewRouter(d Deps) http.Handler {
	api := &API{DB: d.DB, Config: d.Config}

	r := chi.NewRouter()
	for _, mw := range appmw.Chain() {
		r.Use(mw)
	}

	r.Route("/api", func(r chi.Router) {
		r.Get("/health", Health)
		r.Get("/users", api.ListUsers)
		r.Post("/invite", api.Invite)
		r.Post("/register", api.Register)
		r.Post("/users/leave", api.Leave)
	})

	r.Handle("/*", http.FileServer(http.FS(d.Web)))

	return r
}
