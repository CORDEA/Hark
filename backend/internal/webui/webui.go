// Package webui exposes the embedded admin dashboard assets.
package webui

import (
	"embed"
	"io/fs"
)

//go:embed all:dist
var raw embed.FS

// FS returns the admin UI file tree with the "dist/" prefix stripped so that
// index.html sits at the root.
func FS() (fs.FS, error) {
	return fs.Sub(raw, "dist")
}
