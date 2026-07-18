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

	"github.com/cordea/hark/internal/config"
	"github.com/cordea/hark/internal/db"
	"github.com/cordea/hark/internal/handlers"
	"github.com/cordea/hark/internal/webui"
)

func main() {
	slog.SetDefault(slog.New(slog.NewJSONHandler(os.Stdout, nil)))

	cfg := config.Load()

	gdb, err := db.Open(cfg)
	if err != nil {
		slog.Error("db open", "err", err)
		os.Exit(1)
	}

	webSub, err := webui.FS()
	if err != nil {
		slog.Error("web fs", "err", err)
		os.Exit(1)
	}

	handler := handlers.NewRouter(handlers.Deps{DB: gdb, Config: cfg, Web: webSub})

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

	ctx, stop := signal.NotifyContext(context.Background(), os.Interrupt, syscall.SIGTERM)
	defer stop()
	<-ctx.Done()

	slog.Info("shutting down")
	shutdownCtx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()
	if err := srv.Shutdown(shutdownCtx); err != nil {
		slog.Error("shutdown", "err", err)
	}
}
