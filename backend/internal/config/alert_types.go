package config

import (
	"encoding/json"
	"errors"
	"fmt"
	"io/fs"
	"os"
	"regexp"
	"strings"
)

// AlertType is one row of the operator-supplied alert-type catalog.
//
// The catalog is loaded once at boot from the JSON file at
// [Config.AlertTypesPath]. It defines every value the /alerts/trigger
// endpoint accepts and drives the badge label + color rendered by the mobile
// clients. See the sample at backend/data/alert_types.json.
type AlertType struct {
	ID          string `json:"id"`
	Name        string `json:"name"`
	Description string `json:"description"`
	Color       string `json:"color"`
}

// AlertTypes wraps the parsed catalog with an index by id.
type AlertTypes struct {
	List []AlertType
	byID map[string]AlertType
}

// Lookup returns the type with the given id and whether it was found.
func (a AlertTypes) Lookup(id string) (AlertType, bool) {
	t, ok := a.byID[id]
	return t, ok
}

// defaultAlertTypes is served when no configuration file is present. It keeps
// `docker compose up` working out of the box without an operator seeding a
// catalog first.
var defaultAlertTypes = []AlertType{
	{ID: "p0", Name: "P0", Description: "Critical", Color: "#E84A5F"},
	{ID: "p1", Name: "P1", Description: "Warning", Color: "#E0B950"},
}

type alertTypesFile struct {
	Types []AlertType `json:"types"`
}

var hexColorRE = regexp.MustCompile(`^#[0-9a-fA-F]{6}$`)

// LoadAlertTypes reads and validates the catalog at path. An empty path or a
// missing file yields the built-in defaults; a present-but-broken file is a
// hard error because a silent fallback would let a misconfigured deploy accept
// alert ids that never round-trip to the mobile client.
func LoadAlertTypes(path string) (AlertTypes, error) {
	path = strings.TrimSpace(path)
	if path == "" {
		return buildAlertTypes(defaultAlertTypes)
	}
	raw, err := os.ReadFile(path)
	if err != nil {
		if errors.Is(err, fs.ErrNotExist) {
			return buildAlertTypes(defaultAlertTypes)
		}
		return AlertTypes{}, fmt.Errorf("read alert types %q: %w", path, err)
	}
	var file alertTypesFile
	if err := json.Unmarshal(raw, &file); err != nil {
		return AlertTypes{}, fmt.Errorf("parse alert types %q: %w", path, err)
	}
	return buildAlertTypes(file.Types)
}

func buildAlertTypes(list []AlertType) (AlertTypes, error) {
	if len(list) == 0 {
		return AlertTypes{}, errors.New("alert types catalog is empty")
	}
	byID := make(map[string]AlertType, len(list))
	out := make([]AlertType, 0, len(list))
	for i, t := range list {
		t.ID = strings.TrimSpace(t.ID)
		t.Name = strings.TrimSpace(t.Name)
		t.Description = strings.TrimSpace(t.Description)
		t.Color = strings.TrimSpace(t.Color)
		if t.ID == "" {
			return AlertTypes{}, fmt.Errorf("alert type at index %d has empty id", i)
		}
		if t.Name == "" {
			return AlertTypes{}, fmt.Errorf("alert type %q has empty name", t.ID)
		}
		if !hexColorRE.MatchString(t.Color) {
			return AlertTypes{}, fmt.Errorf("alert type %q color %q must be #RRGGBB", t.ID, t.Color)
		}
		if _, dup := byID[t.ID]; dup {
			return AlertTypes{}, fmt.Errorf("alert type %q is duplicated", t.ID)
		}
		byID[t.ID] = t
		out = append(out, t)
	}
	return AlertTypes{List: out, byID: byID}, nil
}
