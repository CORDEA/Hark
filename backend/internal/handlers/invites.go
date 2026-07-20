package handlers

import (
	"errors"
	"strings"

	"gorm.io/gorm"
)

func defaultName(name string) string {
	name = strings.TrimSpace(name)
	if name == "" {
		return "Subscriber"
	}
	return name
}

// isUniqueViolation reports whether err looks like a unique-constraint failure.
// GORM does not expose a portable sentinel; the message check covers both
// SQLite ("UNIQUE constraint failed") and Postgres ("duplicate key value
// violates unique constraint").
func isUniqueViolation(err error) bool {
	if err == nil || errors.Is(err, gorm.ErrRecordNotFound) {
		return false
	}
	return strings.Contains(strings.ToLower(err.Error()), "unique") ||
		strings.Contains(strings.ToLower(err.Error()), "duplicate key")
}
