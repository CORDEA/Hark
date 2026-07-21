package handlers

import (
	"net/http"
	"testing"
	"time"

	"github.com/google/uuid"

	"github.com/cordea/hark/internal/models"
)

func TestCreateInvitationRoundtrip(t *testing.T) {
	h := newTestHarness(t)

	res := h.do(http.MethodPost, "/api/invitations", "", map[string]string{
		"display_name": "New Person",
	})
	if res.StatusCode != http.StatusCreated {
		t.Fatalf("create: got %d, want 201", res.StatusCode)
	}
	env := decodeEnvelope(t, res)
	data, ok := env.Data.(map[string]any)
	if !ok {
		t.Fatalf("data is %T", env.Data)
	}
	if data["kind"] != invitationKindNewUser {
		t.Fatalf("kind = %v, want new_user", data["kind"])
	}
	code, _ := data["code"].(string)
	if code == "" {
		t.Fatalf("code missing from create response")
	}
	if link, _ := data["universal_link"].(string); link == "" {
		t.Fatalf("universal_link missing")
	}

	// Lookup as the mobile client would.
	res = h.do(http.MethodGet, "/api/invitations/"+code, "", nil)
	if res.StatusCode != http.StatusOK {
		t.Fatalf("get: got %d, want 200", res.StatusCode)
	}
	env = decodeEnvelope(t, res)
	lookup, _ := env.Data.(map[string]any)
	if lookup["kind"] != invitationKindNewUser {
		t.Fatalf("lookup kind = %v, want new_user", lookup["kind"])
	}
	if lookup["org_name"] != "Hark Test" {
		t.Fatalf("org_name = %v", lookup["org_name"])
	}
}

func TestGetInvitationExpiredReturnsGone(t *testing.T) {
	h := newTestHarness(t)
	inv := models.Invitation{
		Code:      "EXPIRED-1",
		CreatedAt: time.Now().UTC().Add(-2 * time.Hour),
		ExpiresAt: time.Now().UTC().Add(-time.Minute),
	}
	if err := h.DB.Create(&inv).Error; err != nil {
		t.Fatalf("seed: %v", err)
	}

	res := h.do(http.MethodGet, "/api/invitations/"+inv.Code, "", nil)
	if res.StatusCode != http.StatusGone {
		t.Fatalf("expired: got %d, want 410", res.StatusCode)
	}
}

func TestGetInvitationUsedReturnsGone(t *testing.T) {
	h := newTestHarness(t)
	now := time.Now().UTC()
	usedBy := "some-user"
	inv := models.Invitation{
		Code:         "USED-1",
		CreatedAt:    now.Add(-time.Minute),
		ExpiresAt:    now.Add(time.Hour),
		UsedAt:       &now,
		UsedByUserID: &usedBy,
	}
	if err := h.DB.Create(&inv).Error; err != nil {
		t.Fatalf("seed: %v", err)
	}

	res := h.do(http.MethodGet, "/api/invitations/"+inv.Code, "", nil)
	if res.StatusCode != http.StatusGone {
		t.Fatalf("used: got %d, want 410", res.StatusCode)
	}
}

func TestListInvitationsExcludesUsedAndExpired(t *testing.T) {
	h := newTestHarness(t)
	now := time.Now().UTC()
	usedAt := now.Add(-5 * time.Minute)
	usedBy := "u1"
	rows := []models.Invitation{
		{Code: "OPEN-1", CreatedAt: now, ExpiresAt: now.Add(time.Hour)},
		{Code: "OPEN-2", CreatedAt: now, ExpiresAt: now.Add(time.Hour)},
		{Code: "USED-1", CreatedAt: now, ExpiresAt: now.Add(time.Hour), UsedAt: &usedAt, UsedByUserID: &usedBy},
		{Code: "EXP-1", CreatedAt: now.Add(-2 * time.Hour), ExpiresAt: now.Add(-time.Hour)},
	}
	for i := range rows {
		if err := h.DB.Create(&rows[i]).Error; err != nil {
			t.Fatalf("seed: %v", err)
		}
	}

	res := h.do(http.MethodGet, "/api/invitations", "", nil)
	if res.StatusCode != http.StatusOK {
		t.Fatalf("list: got %d, want 200", res.StatusCode)
	}
	env := decodeEnvelope(t, res)
	arr, _ := env.Data.([]any)
	if len(arr) != 2 {
		t.Fatalf("list len = %d, want 2 (only open ones)", len(arr))
	}
	codes := map[string]bool{}
	for _, row := range arr {
		m, _ := row.(map[string]any)
		codes[m["code"].(string)] = true
	}
	if !codes["OPEN-1"] || !codes["OPEN-2"] {
		t.Fatalf("list codes = %v", codes)
	}
}

func TestDeleteInvitationRevokes(t *testing.T) {
	h := newTestHarness(t)
	inv := models.Invitation{
		Code: "REVOKE-1", CreatedAt: time.Now().UTC(),
		ExpiresAt: time.Now().UTC().Add(time.Hour),
	}
	if err := h.DB.Create(&inv).Error; err != nil {
		t.Fatalf("seed: %v", err)
	}
	res := h.do(http.MethodDelete, "/api/invitations/"+inv.Code, "", nil)
	if res.StatusCode != http.StatusOK {
		t.Fatalf("delete: got %d, want 200", res.StatusCode)
	}
	res.Body.Close()

	var count int64
	h.DB.Model(&models.Invitation{}).Where("code = ?", inv.Code).Count(&count)
	if count != 0 {
		t.Fatalf("invitation not deleted: count=%d", count)
	}
}

func TestCreateAddDeviceInvitationRequiresUser(t *testing.T) {
	h := newTestHarness(t)
	res := h.do(http.MethodPost, "/api/users/"+uuid.NewString()+"/add-device-invitations", "", nil)
	if res.StatusCode != http.StatusNotFound {
		t.Fatalf("missing user: got %d, want 404", res.StatusCode)
	}
}

func TestCreateAddDeviceInvitationMarksTarget(t *testing.T) {
	h := newTestHarness(t)
	user, _ := h.seedUserWithDevice("fcm-x")

	res := h.do(http.MethodPost, "/api/users/"+user.ID+"/add-device-invitations", "", nil)
	if res.StatusCode != http.StatusCreated {
		t.Fatalf("add-device: got %d, want 201", res.StatusCode)
	}
	env := decodeEnvelope(t, res)
	data, _ := env.Data.(map[string]any)
	if data["kind"] != invitationKindAddDevice {
		t.Fatalf("kind = %v, want add_device", data["kind"])
	}

	var inv models.Invitation
	if err := h.DB.Where("code = ?", data["code"]).First(&inv).Error; err != nil {
		t.Fatalf("load: %v", err)
	}
	if inv.TargetUserID == nil || *inv.TargetUserID != user.ID {
		t.Fatalf("target_user_id = %v, want %s", inv.TargetUserID, user.ID)
	}
}
