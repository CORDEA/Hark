package db

import (
	"errors"
	"fmt"
	"log/slog"
	"os"
	"time"

	"gorm.io/driver/postgres"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
	gormlogger "gorm.io/gorm/logger"

	"github.com/cordea/hark/internal/auth"
	"github.com/cordea/hark/internal/config"
	"github.com/cordea/hark/internal/models"
	wapkg "github.com/cordea/hark/internal/webauthn"
)

// ErrRPIDDrift is returned when PUBLIC_URL's hostname differs from the
// server_meta.rp_id captured on first boot. Continuing would silently
// orphan every existing credential, so we refuse to start unless the
// operator sets RP_ID_OVERRIDE=true to acknowledge the reset.
var ErrRPIDDrift = errors.New("rp_id drift: PUBLIC_URL hostname changed since first boot")

func Open(cfg config.Config) (*gorm.DB, error) {
	gormCfg := &gorm.Config{
		Logger: gormlogger.Default.LogMode(gormlogger.Warn),
	}

	var dialector gorm.Dialector
	switch cfg.DBDriver {
	case "sqlite":
		dialector = sqlite.Open(cfg.DBDSN)
	case "postgres":
		dialector = postgres.Open(cfg.DBDSN)
	default:
		return nil, fmt.Errorf("unsupported DB_DRIVER %q", cfg.DBDriver)
	}

	gdb, err := gorm.Open(dialector, gormCfg)
	if err != nil {
		return nil, fmt.Errorf("open db: %w", err)
	}
	if err := gdb.AutoMigrate(
		&models.User{},
		&models.Device{},
		&models.Alert{},
		&models.AlertRecipient{},
		&models.Invitation{},
		&models.Credential{},
		&models.WebAuthnChallenge{},
		&models.ServerMeta{},
	); err != nil {
		return nil, fmt.Errorf("auto-migrate: %w", err)
	}
	if _, err := EnsureServerMeta(gdb, cfg); err != nil {
		return nil, err
	}
	slog.Info("db ready", "driver", cfg.DBDriver)
	return gdb, nil
}

// EnsureServerMeta reads the singleton server_meta row, seeding it on first
// boot with rp_id derived from cfg.PublicURL and a fresh HS256 signing key.
// On subsequent boots, it verifies the rp_id still matches the current
// PUBLIC_URL hostname; drift returns ErrRPIDDrift unless the operator sets
// RP_ID_OVERRIDE=true to acknowledge the reset.
func EnsureServerMeta(gdb *gorm.DB, cfg config.Config) (models.ServerMeta, error) {
	host, err := wapkg.HostFromURL(cfg.PublicURL)
	if err != nil {
		return models.ServerMeta{}, fmt.Errorf("derive rp_id from PUBLIC_URL: %w", err)
	}

	var meta models.ServerMeta
	err = gdb.First(&meta, "id = ?", models.ServerMetaSingletonID).Error
	switch {
	case err == nil:
		if meta.RPID == host {
			return meta, nil
		}
		if os.Getenv("RP_ID_OVERRIDE") != "true" {
			slog.Error("rp_id drift",
				"stored", meta.RPID,
				"public_url_host", host,
				"hint", "set RP_ID_OVERRIDE=true to reset (orphans every existing credential)")
			return models.ServerMeta{}, fmt.Errorf("%w: stored=%q current=%q", ErrRPIDDrift, meta.RPID, host)
		}
		slog.Warn("rp_id override active — resetting rp_id and rotating signing key",
			"old_rp_id", meta.RPID, "new_rp_id", host)
		key, err := auth.GenerateSigningKey()
		if err != nil {
			return models.ServerMeta{}, err
		}
		meta.RPID = host
		meta.JWTSigningKey = key
		if err := gdb.Save(&meta).Error; err != nil {
			return models.ServerMeta{}, fmt.Errorf("update server_meta: %w", err)
		}
		return meta, nil
	case errors.Is(err, gorm.ErrRecordNotFound):
		key, err := auth.GenerateSigningKey()
		if err != nil {
			return models.ServerMeta{}, err
		}
		meta = models.ServerMeta{
			ID:            models.ServerMetaSingletonID,
			RPID:          host,
			JWTSigningKey: key,
			CreatedAt:     time.Now().UTC(),
		}
		if err := gdb.Create(&meta).Error; err != nil {
			return models.ServerMeta{}, fmt.Errorf("seed server_meta: %w", err)
		}
		slog.Info("server_meta seeded", "rp_id", host)
		return meta, nil
	default:
		return models.ServerMeta{}, fmt.Errorf("load server_meta: %w", err)
	}
}
