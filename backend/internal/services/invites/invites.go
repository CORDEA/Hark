// Package invites generates invitation codes and deep-link payloads.
package invites

import (
	"crypto/rand"
	"fmt"
	"net/url"
	"strings"
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
