package main

import (
	"context"
	"errors"
	"log/slog"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	"github.com/cordea/hark/internal/auth"
	"github.com/cordea/hark/internal/config"
	"github.com/cordea/hark/internal/db"
	"github.com/cordea/hark/internal/handlers"
	alertsvc "github.com/cordea/hark/internal/services/alerts"
	"github.com/cordea/hark/internal/services/fcm"
	"github.com/cordea/hark/internal/services/i18n"
	wapkg "github.com/cordea/hark/internal/webauthn"
	"github.com/cordea/hark/internal/webui"
)

func main() {
	slog.SetDefault(slog.New(slog.NewJSONHandler(os.Stdout, nil)))

	ctx, stop := signal.NotifyContext(context.Background(), os.Interrupt, syscall.SIGTERM)
	defer stop()

	cfg := config.Load()

	gdb, err := db.Open(cfg)
	if err != nil {
		slog.Error("db open", "err", err)
		os.Exit(1)
	}

	meta, err := db.EnsureServerMeta(gdb, cfg)
	if err != nil {
		slog.Error("server meta", "err", err)
		os.Exit(1)
	}

	rp, err := wapkg.BuildRP(cfg, meta)
	if err != nil {
		slog.Error("webauthn init", "err", err)
		os.Exit(1)
	}

	signer := auth.NewSigner(meta.JWTSigningKey, cfg.PublicURL)

	sender, err := fcm.New(ctx, cfg.FCMCredentials)
	if err != nil {
		slog.Error("fcm init", "err", err)
		os.Exit(1)
	}

	webSub, err := webui.FS()
	if err != nil {
		slog.Error("web fs", "err", err)
		os.Exit(1)
	}

	localizer := i18n.New()
	alertService := &alertsvc.Service{DB: gdb, Sender: sender, Localizer: localizer, PublicURL: cfg.PublicURL}

	handler := handlers.NewRouter(handlers.Deps{
		DB:     gdb,
		Config: cfg,
		Web:    webSub,
		Alerts: alertService,
		RP:     rp,
		Signer: signer,
	})

	srv := &http.Server{
		Addr:              ":" + cfg.Port,
		Handler:           handler,
		ReadHeaderTimeout: 5 * time.Second,
	}

	go func() {
		slog.Info("listening", "addr", srv.Addr)
		if err := srv.ListenAndServe(); err != nil && !errors.Is(err, http.ErrServerClosed) {
			slog.Error("serve", "err", err)
			os.Exit(1)
		}
	}()

	<-ctx.Done()
	slog.Info("shutting down")
	shutdownCtx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()
	if err := srv.Shutdown(shutdownCtx); err != nil {
		slog.Error("shutdown", "err", err)
	}
}
