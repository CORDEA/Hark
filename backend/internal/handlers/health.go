package handlers

import "net/http"

func Health(w http.ResponseWriter, r *http.Request) {
	ok(w, map[string]string{"status": "ok"})
}
