package config

import (
	"os"
	"strings"
)

type Config struct {
	Port           string
	DBDriver       string
	DBDSN          string
	FCMCredentials string
	PublicURL      string
	OrgName        string

	// AppleAppIDs is the list of `<TEAMID>.<bundle_id>` app IDs published
	// via /.well-known/apple-app-site-association. Populated from the
	// APPLE_APP_IDS env var (comma-separated).
	AppleAppIDs []string

	// AndroidAppLinks is the list of package/fingerprint pairs published
	// via /.well-known/assetlinks.json. Populated from the
	// ANDROID_APP_LINKS env var: comma-separated `<package>:<sha256>`
	// entries.
	AndroidAppLinks []AndroidAppLink
}

type AndroidAppLink struct {
	Package     string
	Fingerprint string
}

func Load() Config {
	return Config{
		Port:            envOr("PORT", "8080"),
		DBDriver:        envOr("DB_DRIVER", "sqlite"),
		DBDSN:           envOr("DB_DSN", "file:hark.db?_pragma=journal_mode(WAL)&_pragma=foreign_keys(1)"),
		FCMCredentials:  os.Getenv("FCM_CREDENTIALS"),
		PublicURL:       envOr("PUBLIC_URL", "http://localhost:8080"),
		OrgName:         envOr("ORG_NAME", "Hark"),
		AppleAppIDs:     parseCSV(os.Getenv("APPLE_APP_IDS")),
		AndroidAppLinks: parseAndroidAppLinks(os.Getenv("ANDROID_APP_LINKS")),
	}
}

func envOr(key, fallback string) string {
	if v := os.Getenv(key); v != "" {
		return v
	}
	return fallback
}

func parseCSV(raw string) []string {
	raw = strings.TrimSpace(raw)
	if raw == "" {
		return nil
	}
	parts := strings.Split(raw, ",")
	out := make([]string, 0, len(parts))
	for _, p := range parts {
		p = strings.TrimSpace(p)
		if p != "" {
			out = append(out, p)
		}
	}
	return out
}

func parseAndroidAppLinks(raw string) []AndroidAppLink {
	entries := parseCSV(raw)
	if len(entries) == 0 {
		return nil
	}
	out := make([]AndroidAppLink, 0, len(entries))
	for _, e := range entries {
		pkg, fp, ok := strings.Cut(e, ":")
		if !ok {
			continue
		}
		pkg = strings.TrimSpace(pkg)
		fp = strings.TrimSpace(fp)
		if pkg == "" || fp == "" {
			continue
		}
		out = append(out, AndroidAppLink{Package: pkg, Fingerprint: fp})
	}
	return out
}
