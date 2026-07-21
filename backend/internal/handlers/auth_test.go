package handlers

import (
	"net/http"
	"testing"

	"github.com/cordea/hark/internal/models"
)

func TestJWTGuardsDevicesEndpoint(t *testing.T) {
	h := newTestHarness(t)

	res := h.do(http.MethodPost, "/api/devices", "", map[string]string{
		"fcm_token": "some-token",
	})
	if res.StatusCode != http.StatusUnauthorized {
		t.Fatalf("no bearer: got %d, want 401", res.StatusCode)
	}
	res.Body.Close()

	res = h.do(http.MethodPost, "/api/devices", "not-a-real-token", map[string]string{
		"fcm_token": "some-token",
	})
	if res.StatusCode != http.StatusUnauthorized {
		t.Fatalf("garbage bearer: got %d, want 401", res.StatusCode)
	}
	res.Body.Close()
}

func TestMeReturnsCallerProfile(t *testing.T) {
	h := newTestHarness(t)
	user, token := h.seedUserWithDevice("fcm-1")

	res := h.do(http.MethodGet, "/api/me", token, nil)
	if res.StatusCode != http.StatusOK {
		t.Fatalf("me: got %d, want 200", res.StatusCode)
	}
	env := decodeEnvelope(t, res)
	data, ok := env.Data.(map[string]any)
	if !ok {
		t.Fatalf("me: data is %T not map", env.Data)
	}
	if data["org_name"] != "Hark Test" {
		t.Fatalf("me: org_name = %v, want Hark Test", data["org_name"])
	}
	u, _ := data["user"].(map[string]any)
	if u["id"] != user.ID {
		t.Fatalf("me: user.id = %v, want %s", u["id"], user.ID)
	}
	if devices, _ := data["devices"].([]any); len(devices) != 1 {
		t.Fatalf("me: devices len = %d, want 1", len(devices))
	}
	if creds, _ := data["credentials"].([]any); len(creds) != 1 {
		t.Fatalf("me: credentials len = %d, want 1", len(creds))
	}
}

// Kick → 401 is the spec's Instant Session Invalidation contract: deleting
// the user's row invalidates every token they hold on the next request,
// because the JWT middleware's user-existence check fails.
func TestKickInvalidatesJWT(t *testing.T) {
	h := newTestHarness(t)
	user, token := h.seedUserWithDevice("fcm-1")

	// Sanity: token works before kick.
	res := h.do(http.MethodGet, "/api/me", token, nil)
	if res.StatusCode != http.StatusOK {
		t.Fatalf("pre-kick /me: got %d, want 200", res.StatusCode)
	}
	res.Body.Close()

	res = h.do(http.MethodDelete, "/api/users/"+user.ID, "", nil)
	if res.StatusCode != http.StatusOK {
		t.Fatalf("kick: got %d, want 200", res.StatusCode)
	}
	res.Body.Close()

	res = h.do(http.MethodGet, "/api/me", token, nil)
	if res.StatusCode != http.StatusUnauthorized {
		t.Fatalf("post-kick /me: got %d, want 401", res.StatusCode)
	}
	res.Body.Close()

	// Cascade delete should also drop credentials + devices.
	var credCount, devCount int64
	h.DB.Model(&models.Credential{}).Where("user_id = ?", user.ID).Count(&credCount)
	h.DB.Model(&models.Device{}).Where("user_id = ?", user.ID).Count(&devCount)
	if credCount != 0 || devCount != 0 {
		t.Fatalf("kick did not cascade: creds=%d devices=%d", credCount, devCount)
	}
}

func TestDeleteSelfDeviceRemovesUserWhenLast(t *testing.T) {
	h := newTestHarness(t)
	user, token := h.seedUserWithDevice("fcm-only")

	res := h.do(http.MethodDelete, "/api/devices/self", token, map[string]string{
		"fcm_token": "fcm-only",
	})
	if res.StatusCode != http.StatusNoContent {
		t.Fatalf("delete self: got %d, want 204", res.StatusCode)
	}
	res.Body.Close()

	var count int64
	h.DB.Model(&models.User{}).Where("id = ?", user.ID).Count(&count)
	if count != 0 {
		t.Fatalf("user row survived last-device delete: count=%d", count)
	}
}

func TestDeleteSelfDeviceMismatchedTokenFallsBack(t *testing.T) {
	h := newTestHarness(t)
	user, token := h.seedUserWithDevice("original-token")

	// A second device for the same user.
	if err := h.DB.Create(&models.Device{
		ID: "d2", UserID: user.ID, FCMToken: "second-token",
		DeviceName: "d2", Locale: "en",
	}).Error; err != nil {
		t.Fatalf("seed second device: %v", err)
	}

	// Call with a rotated / mismatched token — server should drop every
	// device for the user and cascade the user row.
	res := h.do(http.MethodDelete, "/api/devices/self", token, map[string]string{
		"fcm_token": "rotated-since-registration",
	})
	if res.StatusCode != http.StatusNoContent {
		t.Fatalf("delete self mismatch: got %d, want 204", res.StatusCode)
	}
	res.Body.Close()

	var devCount, userCount int64
	h.DB.Model(&models.Device{}).Where("user_id = ?", user.ID).Count(&devCount)
	h.DB.Model(&models.User{}).Where("id = ?", user.ID).Count(&userCount)
	if devCount != 0 || userCount != 0 {
		t.Fatalf("mismatch fallback left rows: devices=%d users=%d", devCount, userCount)
	}
}
