package webauthn

import "testing"

func TestAndroidAPKKeyHashOrigin(t *testing.T) {
	// Fingerprint from the pinned debug keystore (see
	// app/android/debug.keystore) — same SHA-256 that assetlinks.json
	// declares under sha256_cert_fingerprints. Android Credential
	// Manager derives clientDataJSON.origin from these 32 raw bytes.
	const debugFingerprint = "97:11:55:E8:60:AC:05:F8:ED:06:FE:94:F3:2E:CD:E1:D7:62:BA:EF:9F:48:AA:50:57:B8:8B:50:9A:E4:AF:82"
	const wantOrigin = "android:apk-key-hash:lxFV6GCsBfjtBv6U8y7N4ddiuu-fSKpQV7iLUJrkr4I"

	got, err := androidAPKKeyHashOrigin(debugFingerprint)
	if err != nil {
		t.Fatalf("colon-separated: %v", err)
	}
	if got != wantOrigin {
		t.Fatalf("colon-separated: got %q, want %q", got, wantOrigin)
	}

	unseparated := "971155E860AC05F8ED06FE94F32ECDE1D762BAEF9F48AA5057B88B509AE4AF82"
	got, err = androidAPKKeyHashOrigin(unseparated)
	if err != nil {
		t.Fatalf("unseparated: %v", err)
	}
	if got != wantOrigin {
		t.Fatalf("unseparated: got %q, want %q", got, wantOrigin)
	}
}

func TestAndroidAPKKeyHashOriginRejectsShortFingerprint(t *testing.T) {
	if _, err := androidAPKKeyHashOrigin("AA:BB:CC"); err == nil {
		t.Fatal("expected error on 3-byte fingerprint")
	}
}
