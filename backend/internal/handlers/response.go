package handlers

import (
	"encoding/json"
	"log/slog"
	"net/http"
)

type Envelope struct {
	Data  any     `json:"data"`
	Error *APIErr `json:"error"`
}

type APIErr struct {
	Code    string `json:"code"`
	Message string `json:"message"`
}

func writeJSON(w http.ResponseWriter, status int, body any) {
	w.Header().Set("Content-Type", "application/json; charset=utf-8")
	w.WriteHeader(status)
	if err := json.NewEncoder(w).Encode(body); err != nil {
		slog.Error("write json", "err", err)
	}
}

func ok(w http.ResponseWriter, data any) {
	writeJSON(w, http.StatusOK, Envelope{Data: data})
}

func created(w http.ResponseWriter, data any) {
	writeJSON(w, http.StatusCreated, Envelope{Data: data})
}

func fail(w http.ResponseWriter, status int, code, msg string) {
	writeJSON(w, status, Envelope{Error: &APIErr{Code: code, Message: msg}})
}

func decodeJSON(r *http.Request, dst any) error {
	dec := json.NewDecoder(r.Body)
	dec.DisallowUnknownFields()
	return dec.Decode(dst)
}
