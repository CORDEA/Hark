package handlers

import (
	"encoding/json"
	"io"
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/cordea/hark/internal/config"
)

func TestBuildAASAEmpty(t *testing.T) {
	body := buildAASA(config.Config{})
	if len(body.WebCredentials.Apps) != 0 {
		t.Fatalf("empty AppleAppIDs → webcredentials.apps should be []")
	}
	if len(body.AppLinks.Details) != 0 {
		t.Fatalf("empty AppleAppIDs → applinks.details should be []")
	}
}

func TestBuildAASAWithAppIDs(t *testing.T) {
	body := buildAASA(config.Config{AppleAppIDs: []string{"TEAM.com.example.hark"}})
	if len(body.WebCredentials.Apps) != 1 {
		t.Fatalf("webcredentials.apps len = %d, want 1", len(body.WebCredentials.Apps))
	}
	if len(body.AppLinks.Details) != 1 {
		t.Fatalf("applinks.details len = %d, want 1", len(body.AppLinks.Details))
	}
	if body.AppLinks.Details[0].Components[0].Path != "/join*" {
		t.Fatalf("applinks components path = %q", body.AppLinks.Details[0].Components[0].Path)
	}
}

func TestBuildAssetLinksEmitsTwoEntriesPerPackage(t *testing.T) {
	entries := buildAssetLinks(config.Config{
		AndroidAppLinks: []config.AndroidAppLink{
			{Package: "com.example.hark", Fingerprint: "AA:BB"},
		},
	})
	if len(entries) != 2 {
		t.Fatalf("entries len = %d, want 2", len(entries))
	}
	relations := []string{entries[0].Relation[0], entries[1].Relation[0]}
	want := map[string]bool{
		"delegate_permission/common.handle_all_urls": true,
		"delegate_permission/common.get_login_creds": true,
	}
	for _, r := range relations {
		if !want[r] {
			t.Fatalf("unexpected relation %q", r)
		}
	}
}

func TestAASAEndpointServesJSON(t *testing.T) {
	h := newTestHarness(t)
	res, err := http.Get(h.Server.URL + "/.well-known/apple-app-site-association")
	if err != nil {
		t.Fatalf("get: %v", err)
	}
	defer res.Body.Close()
	if res.StatusCode != http.StatusOK {
		t.Fatalf("aasa: got %d, want 200", res.StatusCode)
	}
	if ct := res.Header.Get("Content-Type"); ct != "application/json" {
		t.Fatalf("content-type = %q", ct)
	}
	var body aasaBody
	buf, _ := io.ReadAll(res.Body)
	if err := json.Unmarshal(buf, &body); err != nil {
		t.Fatalf("decode: %v", err)
	}
}

func TestJoinFallbackRendersCode(t *testing.T) {
	// Bypass httptest so the code path uses a request URL we control.
	req := httptest.NewRequest(http.MethodGet, "/join?code=ABCD-1234", nil)
	rec := httptest.NewRecorder()
	h := &API{Config: config.Config{OrgName: "Test Org"}}
	h.JoinFallback(rec, req)
	if rec.Code != http.StatusOK {
		t.Fatalf("join: got %d, want 200", rec.Code)
	}
	body := rec.Body.String()
	if !containsAll(body, "Test Org", "ABCD-1234") {
		t.Fatalf("join body missing content: %q", body)
	}
}

func containsAll(s string, subs ...string) bool {
	for _, sub := range subs {
		if !contains(s, sub) {
			return false
		}
	}
	return true
}

func contains(s, sub string) bool {
	for i := 0; i+len(sub) <= len(s); i++ {
		if s[i:i+len(sub)] == sub {
			return true
		}
	}
	return false
}
