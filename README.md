# Hark

Zero-context, high-certainty on-call paging.

## Why Hark exists

### The problem: the anti-pattern of on-call paging

In most modern engineering teams, incident alerting heavily relies on instant messaging platforms like Slack or Microsoft Teams using `@here` or `@mention` tags. While convenient, this practice introduces critical vulnerabilities and operational friction:

1. **The noise & alert fatigue.** Slack is cluttered with non-urgent day-to-day chats, thread updates, and memes. During off-hours, on-call engineers either suffer from severe alert fatigue or mute the app entirely, causing them to completely miss high-priority production incidents.
2. **The "too big to fail" security risk.** Enterprise communication apps carry immense context — sensitive logs, internal architectural details, and credentials. Giving an engineer's personal mobile device persistent access to this data creates a massive security liability. If a device is lost or compromised, the blast radius is enormous. However, enforcing short session timeouts often leads to the worst-case scenario: an engineer being silently logged out without noticing, leaving them unreachable during a critical outage.

### The solution: zero-context, high-certainty alerting

Hark decouples the *act of paging* from the *act of debugging*. The system does not care *why* the system is down, nor does it contain any textual context, logs, or sensitive infrastructure data. It has one singular focus: **waking up the right person at the right time with maximum certainty.**

By stripping away all context, we achieve two major breakthroughs:

- **Zero-trust mobile security.** Even if a device running this app is physically stolen or compromised, the attacker gains absolutely zero information about your company's infrastructure, code, or incident history.
- **Uncompromised reliability.** Because the app is incredibly lightweight and data-blind, we can aggressively utilize native OS privileges (such as iOS Critical Alerts and Android High-Priority Channels) to bypass silent modes and DND, ensuring the alert cuts through the noise without consuming excessive battery or breaching user privacy.

Hark is built for teams who value absolute security, high-fidelity alerting, and the peace of mind that comes with complete operational isolation.

## Repository layout

```
app/       Flutter client (iOS + Android)
backend/   Go server, SQLite storage, FCM dispatcher, subscriber web UI
web/       Static assets served by the backend
mise.toml  Pinned toolchain (Go 1.23, Flutter 3.44.6)
```

## Build & deploy

### Prerequisites

- [mise](https://mise.jdx.dev/) to install the pinned toolchain versions:
  ```sh
  mise install
  ```
- A Firebase project with Cloud Messaging enabled. The backend accepts two credential sources, tried in this order:
  1. **Application Default Credentials** — preferred. Works with Workload Identity Federation, the GCE/GKE metadata server, `gcloud auth application-default login`, or `GOOGLE_APPLICATION_CREDENTIALS`. Avoids shipping a long-lived key.
  2. **Service-account JSON file** — fallback. Download a key with the Firebase Cloud Messaging API Admin role and save it as `backend/data/firebase.json` (or set `FCM_CREDENTIALS` to another path).

### Backend — Docker (recommended)

The backend ships a multi-stage Dockerfile and a Compose file that mounts a persistent volume for the SQLite database and FCM credentials.

```sh
cd backend
docker compose up -d --build
```

The service listens on `:8080`. Override the reverse-proxy address by editing `PUBLIC_URL` in `docker-compose.yml`.

### Backend — local run

```sh
cd backend
FCM_CREDENTIALS=./data/firebase.json \
PUBLIC_URL=http://localhost:8080 \
  go run ./cmd/hark
```

Configuration is read entirely from the environment:

| Variable            | Default                                                                | Purpose                            |
|---------------------|------------------------------------------------------------------------|------------------------------------|
| `PORT`              | `8080`                                                                 | HTTP listener port                 |
| `DB_DRIVER`         | `sqlite`                                                               | Database driver                    |
| `DB_DSN`            | `file:hark.db?_pragma=journal_mode(WAL)&_pragma=foreign_keys(1)`       | Database connection string         |
| `FCM_CREDENTIALS`   | *(empty — FCM disabled unless ADC is present)*                         | Path to Firebase service-account (fallback when ADC is unavailable) |
| `PUBLIC_URL`        | `http://localhost:8080`                                                | Base URL embedded in invite QR; also the WebAuthn origin |
| `ORG_NAME`          | `Hark`                                                                 | Organisation name shown in the UI  |
| `APPLE_APP_IDS`     | *(empty)*                                                              | Comma-separated `<TEAMID>.<bundleid>` list published via `/.well-known/apple-app-site-association`. Required for iOS universal links + passkey autofill. |
| `ANDROID_APP_LINKS` | *(empty)*                                                              | Comma-separated `<package>:<sha256-fingerprint>` list published via `/.well-known/assetlinks.json`. Required for Android app links + Credential Manager. |
| `RP_ID_OVERRIDE`    | `false`                                                                | When `PUBLIC_URL`'s hostname differs from the persisted `server_meta.rp_id`, refuse to boot unless this is `true`. Flipping it *invalidates every registered passkey* — only for intentional domain moves. |

### Flutter client

```sh
cd app
flutter pub get
dart run build_runner build --delete-conflicting-outputs

# Debug run against a connected device / simulator
flutter run

# Release builds
flutter build apk --release      # Android
flutter build ipa --release      # iOS (requires Xcode signing)
```

Point the app at your backend's `PUBLIC_URL` during onboarding by scanning the invite QR code served from the subscriber dashboard.

## Passkeys + universal-link binding (self-hosted deploys)

Onboarding uses WebAuthn passkeys and iOS universal links / Android app links. Both need your `PUBLIC_URL`'s hostname to be bound to your signed mobile build via well-known files. The backend serves them dynamically from env — no static hosting required — but you have to hand it the right identifiers.

### 1. Point the backend at your bundle IDs

Populate `APPLE_APP_IDS` and `ANDROID_APP_LINKS` in the backend environment. Both are comma-separated; both accept multiple entries so a single deployment can serve iOS + Android + Play/App Store variants.

```env
APPLE_APP_IDS=ABCDE12345.com.example.hark
ANDROID_APP_LINKS=com.example.hark:AA:BB:CC:...:99
```

- iOS entries are `<TeamID>.<BundleID>`. TeamID is visible in your Apple Developer account membership page.
- Android entries are `<package>:<SHA-256 signing fingerprint>`. Get the fingerprint with:

  ```sh
  keytool -list -v -keystore <keystore> -alias <alias>
  ```

  Use the release keystore for release builds and the debug keystore (usually `~/.android/debug.keystore`, alias `androiddebugkey`, password `android`) for local testing.

The backend serves these at:

- `GET /.well-known/apple-app-site-association` (iOS AASA: `applinks` + `webcredentials`)
- `GET /.well-known/assetlinks.json` (Android app links + Credential Manager)

Both are unauthenticated JSON, cache-friendly, and public.

### 2. Wire the mobile build to `PUBLIC_URL`

**iOS.** `Runner.entitlements` reads the host from the `HARK_LINK_HOST` xcconfig variable (default `hark.example.com` in `ios/Flutter/Debug.xcconfig` and `Release.xcconfig`). Override per-machine without touching tracked files by creating `app/ios/Flutter/Local.xcconfig` (gitignored):

```
HARK_LINK_HOST = your-hark-host.example.com
```

The `applinks:` and `webcredentials:` entries in `Runner.entitlements` are substituted at build time. Then enable the entitlements file in Xcode (`Runner` target → Signing & Capabilities → + Capability → Associated Domains). The mapping is not pre-wired into `project.pbxproj` because that file is fragile to hand-edit.

**Android.** The app link intent-filter host is a `manifestPlaceholder` named `harkLinkHost` (default `hark.example.com`). Override it at build time:

```sh
flutter build apk --release -PharkLinkHost=your-hark-host.example.com
```

The manifest's `android:autoVerify="true"` triggers Play Store / device-side verification against `/.well-known/assetlinks.json` on install — so both the backend env and the signing fingerprint have to match before the first tap of an `https://<host>/join?code=...` link opens the app.

### 3. Confirm the setup

- Curl the well-known endpoints and confirm your app IDs / packages show up.
- On iOS: install a signed TestFlight build, tap the invite QR; the app should open directly instead of Safari. If it stops in Safari, the AASA is unreachable or missing your app ID.
- On Android: `adb shell pm get-app-links <package>` after installing — every domain should read `verified`. If they read `verified? = false`, the assetlinks.json is missing or the fingerprint disagrees.

If any of this drifts (domain change, resigning with a new key), you'll see registration succeed but assertion silently fail with "no matching credential" — the platform authenticator won't hand your app a passkey whose RP ID it no longer trusts.

## Local mobile testing over HTTPS

For Cloudflare Tunnel setup and mobile passkey debugging, see [the Cloudflare Tunnel guide](backend/cloudflared/README.md).
