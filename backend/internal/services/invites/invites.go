// Package invites generates invitation codes and deep-link payloads.
package invites

import (
	"crypto/rand"
	"encoding/base64"
	"fmt"
	"net/url"
	"strings"

	qrcode "github.com/skip2/go-qrcode"
)

// codeAlphabet excludes visually ambiguous characters (0/O, 1/I/L).
const codeAlphabet = "ABCDEFGHJKMNPQRSTUVWXYZ23456789"

// NewCode returns a formatted invitation code like "7F2K-91QZ".
func NewCode() (string, error) {
	raw, err := randChars(8)
	if err != nil {
		return "", err
	}
	return raw[:4] + "-" + raw[4:], nil
}

// DeepLink returns hark://join?server=<url>&code=<code>.
func DeepLink(publicURL, code string) string {
	q := url.Values{}
	q.Set("server", publicURL)
	q.Set("code", code)
	return "hark://join?" + q.Encode()
}

// QRDataURL renders payload as a QR code PNG and returns it as a data URL.
// Generating server-side removes the admin UI's dependency on a third-party
// CDN — which was silently failing behind restrictive networks and surfacing
// as "QRCode is not defined".
func QRDataURL(payload string) (string, error) {
	png, err := qrcode.Encode(payload, qrcode.Medium, 280)
	if err != nil {
		return "", fmt.Errorf("qr encode: %w", err)
	}
	return "data:image/png;base64," + base64.StdEncoding.EncodeToString(png), nil
}

func randChars(n int) (string, error) {
	buf := make([]byte, n)
	if _, err := rand.Read(buf); err != nil {
		return "", fmt.Errorf("rand: %w", err)
	}
	var b strings.Builder
	b.Grow(n)
	for _, x := range buf {
		b.WriteByte(codeAlphabet[int(x)%len(codeAlphabet)])
	}
	return b.String(), nil
}
