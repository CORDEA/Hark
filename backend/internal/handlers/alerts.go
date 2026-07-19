package handlers

import (
	"errors"
	"log/slog"
	"net/http"
	"time"

	"github.com/go-chi/chi/v5"

	"github.com/cordea/hark/internal/services/alerts"
)

type triggerRequest struct {
	Type          string   `json:"type"`
	TargetUserIDs []string `json:"target_user_ids"`
}

type triggerResponse struct {
	ID          string    `json:"id"`
	Type        string    `json:"type"`
	Status      string    `json:"status"`
	TriggeredAt time.Time `json:"triggered_at"`
}

func (h *API) TriggerAlert(w http.ResponseWriter, r *http.Request) {
	var req triggerRequest
	if err := decodeJSON(r, &req); err != nil {
		fail(w, http.StatusBadRequest, "bad_json", err.Error())
		return
	}
	alert, err := h.Alerts.Trigger(r.Context(), req.Type, req.TargetUserIDs)
	switch {
	case err == nil:
		created(w, triggerResponse{
			ID: alert.ID, Type: alert.Type, Status: alert.Status, TriggeredAt: alert.TriggeredAt,
		})
	case errors.Is(err, alerts.ErrInvalidType):
		fail(w, http.StatusBadRequest, "invalid_type", `type must be "critical" or "warning"`)
	case errors.Is(err, alerts.ErrNoRecipients):
		fail(w, http.StatusBadRequest, "no_recipients", "no active users match the target")
	default:
		slog.Error("trigger", "err", err)
		fail(w, http.StatusInternalServerError, "internal", err.Error())
	}
}

type respondRequest struct {
	UserID string `json:"user_id"`
	Action string `json:"action"`
}

type respondResponse struct {
	AlertID       string  `json:"alert_id"`
	Status        string  `json:"status"`
	FirstResponse bool    `json:"first_response"`
	ResponderID   *string `json:"responder_id,omitempty"`
}

func (h *API) RespondAlert(w http.ResponseWriter, r *http.Request) {
	alertID := chi.URLParam(r, "id")
	if alertID == "" {
		fail(w, http.StatusBadRequest, "missing_id", "alert id required")
		return
	}
	var req respondRequest
	if err := decodeJSON(r, &req); err != nil {
		fail(w, http.StatusBadRequest, "bad_json", err.Error())
		return
	}
	if req.UserID == "" {
		fail(w, http.StatusBadRequest, "missing_user", "user_id required")
		return
	}
	alert, first, err := h.Alerts.Respond(r.Context(), alertID, req.UserID, req.Action)
	switch {
	case err == nil:
		ok(w, respondResponse{
			AlertID: alert.ID, Status: alert.Status, FirstResponse: first, ResponderID: alert.ResponderID,
		})
	case errors.Is(err, alerts.ErrAlertNotFound):
		fail(w, http.StatusNotFound, "not_found", "alert not found")
	case errors.Is(err, alerts.ErrUserNotOnAlert):
		fail(w, http.StatusForbidden, "not_recipient", "user is not a recipient of this alert")
	case errors.Is(err, alerts.ErrInvalidAction):
		fail(w, http.StatusBadRequest, "invalid_action", `action must be "acknowledged" or "declined"`)
	default:
		slog.Error("respond", "err", err)
		fail(w, http.StatusInternalServerError, "internal", err.Error())
	}
}

type resolveAdminResponse struct {
	AlertID    string     `json:"alert_id"`
	Status     string     `json:"status"`
	ResolvedAt *time.Time `json:"resolved_at"`
}

func (h *API) ResolveAlertAdmin(w http.ResponseWriter, r *http.Request) {
	alertID := chi.URLParam(r, "id")
	if alertID == "" {
		fail(w, http.StatusBadRequest, "missing_id", "alert id required")
		return
	}
	alert, _, err := h.Alerts.ResolveAdmin(r.Context(), alertID)
	switch {
	case err == nil:
		ok(w, resolveAdminResponse{AlertID: alert.ID, Status: alert.Status, ResolvedAt: alert.ResolvedAt})
	case errors.Is(err, alerts.ErrAlertNotFound):
		fail(w, http.StatusNotFound, "not_found", "alert not found")
	default:
		slog.Error("resolve-admin", "err", err)
		fail(w, http.StatusInternalServerError, "internal", err.Error())
	}
}
