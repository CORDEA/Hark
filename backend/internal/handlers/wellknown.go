package handlers

import (
	"encoding/json"
	"fmt"
	"html"
	"log/slog"
	"net/http"

	"github.com/cordea/hark/internal/config"
)

// AppleAppSiteAssociation serves the AASA payload used for both universal
// links (`applinks`) and passkey RP binding (`webcredentials`). Empty
// AppleAppIDs still serve a well-formed but empty document so browsers /
// OS validators don't see 404s during first-time self-hosting setup.
func (h *API) AppleAppSiteAssociation(w http.ResponseWriter, r *http.Request) {
	body := buildAASA(h.Config)
	writeJSONCached(w, body)
}

// AndroidAssetLinks serves assetlinks.json — the app-link + credential
// association manifest for Android. Two entries per package: one for URL
// handling, one for passkey credential sharing.
func (h *API) AndroidAssetLinks(w http.ResponseWriter, r *http.Request) {
	body := buildAssetLinks(h.Config)
	writeJSONCached(w, body)
}

// JoinFallback serves an HTML landing page for /join?code=<code>. If the
// user has the app installed, the OS intercepts this URL and hands it to
// the app before the browser ever loads the page. This fallback exists for
// users who tap the link on a device without the app installed.
func (h *API) JoinFallback(w http.ResponseWriter, r *http.Request) {
	code := r.URL.Query().Get("code")
	safeCode := html.EscapeString(code)
	safeOrg := html.EscapeString(h.Config.OrgName)
	page := fmt.Sprintf(`<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Install Hark to join %[1]s</title>
  <style>
    body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; margin: 0; padding: 2rem; color: #111; background: #fafafa; }
    main { max-width: 32rem; margin: 4rem auto; padding: 2rem; background: #fff; border-radius: 12px; box-shadow: 0 1px 4px rgba(0,0,0,0.08); }
    h1 { margin-top: 0; font-size: 1.5rem; }
    code { background: #f0f0f0; padding: 0.1rem 0.4rem; border-radius: 4px; font-size: 0.95em; }
    p { line-height: 1.5; }
  </style>
</head>
<body>
  <main>
    <h1>Install Hark to accept this invitation</h1>
    <p>You&rsquo;ve tapped an invitation link for <strong>%[1]s</strong>. If Hark is installed on this device, it should open automatically.</p>
    <p>If nothing happens, install the Hark app from the App Store or Google Play, then reopen this link.</p>
    <p>Invitation code: <code>%[2]s</code></p>
  </main>
</body>
</html>`, safeOrg, safeCode)
	w.Header().Set("Content-Type", "text/html; charset=utf-8")
	w.Header().Set("Cache-Control", "no-store")
	if _, err := w.Write([]byte(page)); err != nil {
		slog.Warn("write join fallback", "err", err)
	}
}

func writeJSONCached(w http.ResponseWriter, body any) {
	w.Header().Set("Content-Type", "application/json")
	w.Header().Set("Cache-Control", "public, max-age=3600")
	if err := json.NewEncoder(w).Encode(body); err != nil {
		slog.Warn("write well-known", "err", err)
	}
}

type aasaWebCredentials struct {
	Apps []string `json:"apps"`
}

type aasaAppLinks struct {
	Apps    []string     `json:"apps"`
	Details []aasaDetail `json:"details"`
}

type aasaDetail struct {
	AppIDs     []string      `json:"appIDs"`
	Components []aasaCompRow `json:"components"`
}

type aasaCompRow struct {
	Path string `json:"/"`
}

type aasaBody struct {
	WebCredentials aasaWebCredentials `json:"webcredentials"`
	AppLinks       aasaAppLinks       `json:"applinks"`
}

func buildAASA(cfg config.Config) aasaBody {
	apps := cfg.AppleAppIDs
	if apps == nil {
		apps = []string{}
	}
	details := []aasaDetail{}
	if len(apps) > 0 {
		details = append(details, aasaDetail{
			AppIDs:     apps,
			Components: []aasaCompRow{{Path: "/join*"}},
		})
	}
	return aasaBody{
		WebCredentials: aasaWebCredentials{Apps: apps},
		AppLinks: aasaAppLinks{
			Apps:    []string{},
			Details: details,
		},
	}
}

type assetLinkEntry struct {
	Relation []string        `json:"relation"`
	Target   assetLinkTarget `json:"target"`
}

type assetLinkTarget struct {
	Namespace              string   `json:"namespace"`
	PackageName            string   `json:"package_name"`
	SHA256CertFingerprints []string `json:"sha256_cert_fingerprints"`
}

func buildAssetLinks(cfg config.Config) []assetLinkEntry {
	out := make([]assetLinkEntry, 0, 2*len(cfg.AndroidAppLinks))
	for _, l := range cfg.AndroidAppLinks {
		target := assetLinkTarget{
			Namespace:              "android_app",
			PackageName:            l.Package,
			SHA256CertFingerprints: []string{l.Fingerprint},
		}
		out = append(out,
			assetLinkEntry{
				Relation: []string{"delegate_permission/common.handle_all_urls"},
				Target:   target,
			},
			assetLinkEntry{
				Relation: []string{"delegate_permission/common.get_login_creds"},
				Target:   target,
			},
		)
	}
	return out
}
