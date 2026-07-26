# Hark mobile app

The Hark client is a Flutter app for iOS and Android. It receives on-call notifications and uses passkeys to authenticate with the backend.

## Run locally

Install the repository toolchains first; see the [root README](../README.md).

```sh
flutter pub get
dart run build_runner build --delete-conflicting-outputs

# Debug run against a connected device or simulator
flutter run
```

Release builds:

```sh
flutter build apk --release
flutter build ipa --release # requires Xcode signing
```

During onboarding, scan the invite QR code served by the backend. The app will use the backend's `PUBLIC_URL`.

## Passkeys and app links

The app's link host must exactly match the hostname in the backend's `PUBLIC_URL`. The backend publishes the required Apple and Android well-known files; see [backend configuration](../backend/README.md#passkeys-and-app-link-binding).

### iOS

`Runner.entitlements` reads the host from `HARK_LINK_HOST`. Set it without changing tracked files by creating `app/ios/Flutter/Local.xcconfig`:

```
HARK_LINK_HOST = your-hark-host.example.com
```

This value is required for both Debug and Release builds and must match the hostname in the backend's `PUBLIC_URL`.

The `applinks:` and `webcredentials:` entries in `Runner.entitlements` are substituted at build time. Enable the entitlements file in Xcode: `Runner` target → **Signing & Capabilities** → **Associated Domains**.

### Android

The app-link intent-filter host is the Gradle `harkLinkHost` placeholder. It defaults to `hark.example.com`; override it at build time:

```sh
flutter build apk --release -PharkLinkHost=your-hark-host.example.com
```

`android:autoVerify="true"` asks the device to verify the host against `/.well-known/assetlinks.json` when the app is installed.

## Verify mobile-link configuration

- **iOS:** Install a signed TestFlight build and tap an invite QR. The app should open directly rather than in Safari.
- **Android:** After installing, run `adb shell pm get-app-links <package>`. Each domain should report `verified`; otherwise, check `assetlinks.json` and the signing fingerprint.

If you change the domain or re-sign with a new key, passkey assertions can fail because the platform authenticator no longer trusts the credential's RP ID.
