package db

import (
	"fmt"
	"log/slog"

	"gorm.io/driver/postgres"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
	gormlogger "gorm.io/gorm/logger"

	"github.com/cordea/hark/internal/config"
	"github.com/cordea/hark/internal/models"
)

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
	); err != nil {
		return nil, fmt.Errorf("auto-migrate: %w", err)
	}
	slog.Info("db ready", "driver", cfg.DBDriver)
	return gdb, nil
}
