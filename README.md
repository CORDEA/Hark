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

| Variable          | Default                                                                | Purpose                            |
|-------------------|------------------------------------------------------------------------|------------------------------------|
| `PORT`            | `8080`                                                                 | HTTP listener port                 |
| `DB_DRIVER`       | `sqlite`                                                               | Database driver                    |
| `DB_DSN`          | `file:hark.db?_pragma=journal_mode(WAL)&_pragma=foreign_keys(1)`       | Database connection string         |
| `FCM_CREDENTIALS` | *(empty — FCM disabled unless ADC is present)*                         | Path to Firebase service-account (fallback when ADC is unavailable) |
| `PUBLIC_URL`      | `http://localhost:8080`                                                | Base URL embedded in invite QR     |
| `ORG_NAME`        | `Hark`                                                                 | Organisation name shown in the UI  |

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
