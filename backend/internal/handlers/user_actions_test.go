package handlers

import (
	"net/http"
	"testing"

	"github.com/cordea/hark/internal/models"
)

func TestDeleteSelfDeletesCallerAndCredentials(t *testing.T) {
	h := newTestHarness(t)
	user, token := h.seedUserWithDevice("fcm-1")

	res := h.do(http.MethodDelete, "/api/self", token, nil)
	if res.StatusCode != http.StatusOK {
		t.Fatalf("delete self: got %d, want 200", res.StatusCode)
	}
	decodeEnvelope(t, res)

	var users, credentials int64
	h.DB.Model(&models.User{}).Where("id = ?", user.ID).Count(&users)
	h.DB.Model(&models.Credential{}).Where("user_id = ?", user.ID).Count(&credentials)
	if users != 0 || credentials != 0 {
		t.Fatalf("delete self did not cascade: users=%d credentials=%d", users, credentials)
	}

	res = h.do(http.MethodDelete, "/api/self", token, nil)
	if res.StatusCode != http.StatusUnauthorized {
		t.Fatalf("second delete self: got %d, want 401", res.StatusCode)
	}
	res.Body.Close()
}

func TestDeleteSelfRequiresAuthentication(t *testing.T) {
	h := newTestHarness(t)
	res := h.do(http.MethodDelete, "/api/self", "", nil)
	if res.StatusCode != http.StatusUnauthorized {
		t.Fatalf("unauthenticated delete self: got %d, want 401", res.StatusCode)
	}
	res.Body.Close()
}
