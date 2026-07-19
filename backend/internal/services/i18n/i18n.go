// Package i18n resolves localized strings for outgoing notifications.
//
// Catalogs are keyed by BCP-47 tag ("en", "en-US", "ja"). Lookups fall back
// exact → language-only → default locale, then key-as-string. Placeholders
// use {name} syntax and are replaced from the args map.
//
// This is intentionally tiny: the client renders all in-app UI from its own
// arb bundle, so the server only needs to build push notification title/body
// strings that show in the OS shelf when the app isn't in foreground.
package i18n

import (
	"strings"
	"sync"
)

// DefaultLocale is used when the device's locale isn't in any catalog.
const DefaultLocale = "en"

// Catalog is one locale's key→template map.
type Catalog map[string]string

// Localizer holds registered catalogs and resolves keys.
type Localizer struct {
	mu       sync.RWMutex
	catalogs map[string]Catalog
}

// New returns a Localizer seeded with the built-in English catalog.
func New() *Localizer {
	l := &Localizer{catalogs: make(map[string]Catalog)}
	l.Register(DefaultLocale, enCatalog())
	return l
}

// Register adds or replaces a catalog for a locale tag. Locale is normalized
// to lowercase.
func (l *Localizer) Register(locale string, cat Catalog) {
	l.mu.Lock()
	defer l.mu.Unlock()
	l.catalogs[normalize(locale)] = cat
}

// T looks up key for the given locale and interpolates {name} placeholders
// from args. Falls back to the primary language, then DefaultLocale, then
// returns the key itself when nothing matches — never returns an empty string
// so callers can safely pass the result to FCM.
func (l *Localizer) T(locale, key string, args map[string]string) string {
	l.mu.RLock()
	defer l.mu.RUnlock()

	tag := normalize(locale)
	if tmpl, ok := lookup(l.catalogs, tag, key); ok {
		return interpolate(tmpl, args)
	}
	if primary, _, cut := strings.Cut(tag, "-"); cut {
		if tmpl, ok := lookup(l.catalogs, primary, key); ok {
			return interpolate(tmpl, args)
		}
	}
	if tag != DefaultLocale {
		if tmpl, ok := lookup(l.catalogs, DefaultLocale, key); ok {
			return interpolate(tmpl, args)
		}
	}
	return key
}

func lookup(catalogs map[string]Catalog, locale, key string) (string, bool) {
	cat, ok := catalogs[locale]
	if !ok {
		return "", false
	}
	tmpl, ok := cat[key]
	return tmpl, ok
}

func normalize(locale string) string {
	locale = strings.TrimSpace(locale)
	if locale == "" {
		return DefaultLocale
	}
	return strings.ToLower(locale)
}

func interpolate(tmpl string, args map[string]string) string {
	if len(args) == 0 || !strings.Contains(tmpl, "{") {
		return tmpl
	}
	var b strings.Builder
	b.Grow(len(tmpl))
	for i := 0; i < len(tmpl); {
		if tmpl[i] != '{' {
			b.WriteByte(tmpl[i])
			i++
			continue
		}
		end := strings.IndexByte(tmpl[i+1:], '}')
		if end < 0 {
			b.WriteString(tmpl[i:])
			break
		}
		name := tmpl[i+1 : i+1+end]
		if v, ok := args[name]; ok {
			b.WriteString(v)
		} else {
			b.WriteString(tmpl[i : i+1+end+1])
		}
		i += 1 + end + 1
	}
	return b.String()
}

func enCatalog() Catalog {
	return Catalog{
		// Alert push notifications.
		"push.alert.critical.title": "Critical alert",
		"push.alert.critical.body":  "Tap to respond.",
		"push.alert.warning.title":  "Warning alert",
		"push.alert.warning.body":   "Tap to respond.",

		// Silent-resolve is data-only in practice, but populate the strings so
		// clients that decide to surface a notification have text to show.
		"push.resolve.title": "Alert resolved",
		"push.resolve.body":  "No further action needed.",

		// Test ping (used by the admin console to verify a subscriber's device).
		"push.test.title": "Hark test ping",
		"push.test.body":  "Push notifications are working.",
	}
}
