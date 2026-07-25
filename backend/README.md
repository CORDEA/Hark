# Hark backend

The backend is a Go service with SQLite storage, Firebase Cloud Messaging delivery, and a subscriber web UI.

## Prerequisites

Install the repository toolchains as described in the [root README](../README.md).

Create a Firebase project with Cloud Messaging enabled. The backend tries credentials in this order:

1. **Application Default Credentials (preferred):** Workload Identity Federation, the GCE/GKE metadata server, `gcloud auth application-default login`, or `GOOGLE_APPLICATION_CREDENTIALS`.
2. **Service-account JSON file (fallback):** Download a key with the Firebase Cloud Messaging API Admin role and store it at `backend/data/firebase.json`, or set `FCM_CREDENTIALS` to another path.

## Docker deployment

The Docker setup mounts persistent SQLite data and FCM credentials.

```sh
cd backend
cp .env.example .env # edit PUBLIC_URL, APPLE_APP_IDS, and ANDROID_APP_LINKS
docker compose up -d --build
```

The service listens on `:8080`. Compose automatically reads the gitignored `backend/.env`; values left unset use Compose defaults.

## Run without Docker

`go run` does not load `.env` automatically. Export configuration in your shell:

```sh
cd backend
FCM_CREDENTIALS=./data/firebase.json \
PUBLIC_URL=http://localhost:8080 \
  go run ./cmd/hark
```

## Configuration

| Variable | Default | Purpose |
|---|---|---|
| `PORT` | `8080` | HTTP listener port |
| `DB_DRIVER` | `sqlite` | Database driver |
| `DB_DSN` | `file:hark.db?_pragma=journal_mode(WAL)&_pragma=foreign_keys(1)` | Database connection string |
| `FCM_CREDENTIALS` | *(empty — FCM disabled unless ADC is present)* | Path to a Firebase service-account file when ADC is unavailable |
| `PUBLIC_URL` | **required** | Base URL embedded in invite QR codes and used as the WebAuthn origin |
| `ORG_NAME` | `Hark` | Organisation name shown in the UI |
| `APPLE_APP_IDS` | *(empty)* | Comma-separated `<TEAMID>.<bundleid>` list served in Apple’s association file |
| `ANDROID_APP_LINKS` | *(empty)* | Comma-separated `<package>:<sha256-fingerprint>` list served in Android’s asset-links file |
| `RP_ID_OVERRIDE` | `false` | Allows an intentional persisted RP-ID domain change and invalidates all registered passkeys |

`PUBLIC_URL` is required. Changing its hostname invalidates every registered passkey; use `RP_ID_OVERRIDE=true` only for an intentional domain move.

## Passkeys and app-link binding

Onboarding uses WebAuthn passkeys and iOS universal links / Android app links. Bind the hostname in `PUBLIC_URL` to the signed mobile build by configuring `APPLE_APP_IDS` and `ANDROID_APP_LINKS`.

```env
APPLE_APP_IDS=ABCDE12345.com.example.hark
ANDROID_APP_LINKS=com.example.hark:AA:BB:CC:...:99
```

- iOS entries are `<TeamID>.<BundleID>`; find the Team ID in your Apple Developer membership details.
- Android entries are `<package>:<SHA-256 signing fingerprint>`. Get a fingerprint with `keytool -list -v -keystore <keystore> -alias <alias>`. Use the release keystore for releases and the debug keystore for local testing.

The backend publishes these public endpoints:

- `GET /.well-known/apple-app-site-association` for iOS (`applinks` and `webcredentials`)
- `GET /.well-known/assetlinks.json` for Android app links and Credential Manager

See the [mobile app guide](../app/README.md) for the iOS and Android build configuration that must use the same hostname.

## Local mobile testing over HTTPS

For Cloudflare Tunnel setup and passkey debugging, see [the Cloudflare Tunnel guide](cloudflared/README.md).
