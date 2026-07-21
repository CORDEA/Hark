# Cloudflare Tunnel for local mobile testing

Passkeys work on `http://localhost` in a desktop browser, but iOS and Android require HTTPS on a real domain for Associated Domains and Digital Asset Links. This guide exposes a local Hark backend through a Cloudflare Tunnel, so simulators and emulators can use a stable public hostname.

You need a domain on Cloudflare (registered there or delegated with Cloudflare nameservers) and [`cloudflared`](https://github.com/cloudflare/cloudflared) installed:

```sh
brew install cloudflared
```

## 1. Create a named tunnel (one time)

```sh
cloudflared tunnel login
cloudflared tunnel create hark-dev
cloudflared tunnel route dns hark-dev <your-host> # e.g. dev.example.com
```

`create` prints a UUID and a credentials JSON path, usually `~/.cloudflared/<UUID>.json`. Use both in the next step.

## 2. Configure the tunnel

From the repository root:

```sh
cp backend/cloudflared/config.example.yml backend/cloudflared/config.yml
```

Edit `config.yml`, replacing `<TUNNEL_NAME_OR_UUID>`, `<ABSOLUTE_PATH_TO_TUNNEL_CREDENTIALS_JSON>`, and `<YOUR_HOST>`.

`config.yml` and `*.json` in this directory are gitignored, so credentials are not committed.

## 3. Start the tunnel and backend

In one terminal, start the tunnel:

```sh
backend/scripts/dev-tunnel.sh
```

In another, start the backend with the tunnel hostname:

```sh
cd backend
PUBLIC_URL=https://<your-host> \
APPLE_APP_IDS=<TeamID>.<BundleID> \
ANDROID_APP_LINKS=<package>:<sha256-fingerprint> \
FCM_CREDENTIALS=./data/firebase.json \
  go run ./cmd/hark
```

## 4. Point the mobile builds at the same host

- **iOS:** create `app/ios/Flutter/Local.xcconfig` with `HARK_LINK_HOST = <your-host>`.
- **Android:** run `flutter run -PharkLinkHost=<your-host>` (or use the same flag with `flutter build apk`).

The host must exactly match the hostname in `PUBLIC_URL`. Otherwise, Credential Manager or iCloud Keychain will not surface the passkey for that origin.

## Debugging notes

- **Cloudflare Access:** It protects browser traffic but not direct native-app API calls; for end-to-end tests, disable it, use a service token, or bypass API paths with a policy rule.
- **Changing the hostname invalidates existing credentials.** The host is baked into every registered passkey. After changing it, existing test passkeys cannot be used; on a throwaway database, set `RP_ID_OVERRIDE=true` to intentionally replace the persisted RP ID.
- **Keep real data out of the tunnel.** Cloudflare terminates TLS at its edge. WebAuthn challenges are short-lived, but a development tunnel should not expose a backend holding real user data.
