package handlers

import (
	"net/http"

	"github.com/cordea/hark/internal/config"
)

type alertTypeResponse struct {
	ID          string `json:"id"`
	Name        string `json:"name"`
	Description string `json:"description"`
	Color       string `json:"color"`
}

func (h *API) ListAlertTypes(w http.ResponseWriter, _ *http.Request) {
	out := make([]alertTypeResponse, 0, len(h.Config.AlertTypes.List))
	for _, t := range h.Config.AlertTypes.List {
		out = append(out, toAlertTypeResponse(t))
	}
	ok(w, out)
}

func toAlertTypeResponse(t config.AlertType) alertTypeResponse {
	return alertTypeResponse{
		ID:          t.ID,
		Name:        t.Name,
		Description: t.Description,
		Color:       t.Color,
	}
}
