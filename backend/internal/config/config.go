package config

import (
	"os"
)

type Config struct {
	Port           string
	DBDriver       string
	DBDSN          string
	FCMCredentials string
	PublicURL      string
	OrgName        string
}

func Load() Config {
	return Config{
		Port:           envOr("PORT", "8080"),
		DBDriver:       envOr("DB_DRIVER", "sqlite"),
		DBDSN:          envOr("DB_DSN", "file:hark.db?_pragma=journal_mode(WAL)&_pragma=foreign_keys(1)"),
		FCMCredentials: os.Getenv("FCM_CREDENTIALS"),
		PublicURL:      envOr("PUBLIC_URL", "http://localhost:8080"),
		OrgName:        envOr("ORG_NAME", "Hark"),
	}
}

func envOr(key, fallback string) string {
	if v := os.Getenv(key); v != "" {
		return v
	}
	return fallback
}
