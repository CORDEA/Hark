import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/fcm/fcm_token_provider.dart';
import '../domain/register_device_use_case.dart';
import '../domain/register_with_passkey_use_case.dart';
import '../domain/resolve_invitation_use_case.dart';
import 'connect_org_view_state.dart';

part 'connect_org_view_model.g.dart';

/// Drives the new-user onboarding wizard:
///
/// 1. [ConnectOrgStep.input] — user enters server URL + invitation code
/// 2. [ConnectOrgStep.confirm] — we've resolved the invitation and are
///    showing "Join {org_name}?"
/// 3. [ConnectOrgStep.registering] — passkey ceremony + JWT mint
/// 4. [ConnectOrgStep.registeringDevice] — /api/devices attaches FCM
///
/// On success we emit [ConnectOrgViewEvent.navigateToOrgs]. A device
/// registration failure after a successful passkey mint is treated as
/// non-fatal — the profile is already saved, so we still navigate but
/// surface a snackbar so the user can retry from the list page (M4).
@riverpod
class ConnectOrgViewModel extends _$ConnectOrgViewModel {
  @override
  ConnectOrgViewState build({String? initialServer, String? initialCode}) {
    return ConnectOrgViewState(
      serverUrl: initialServer ?? '',
      invitationCode: initialCode ?? '',
    );
  }

  void onServerUrlChanged(String value) =>
      state = state.copyWith(serverUrl: value);

  void onInvitationCodeChanged(String value) =>
      state = state.copyWith(invitationCode: value);

  Future<void> onContinueTapped() async {
    if (state.isBusy) return;
    final serverUrl = _normalize(state.serverUrl.trim());
    final code = state.invitationCode.trim();
    if (serverUrl.isEmpty || code.isEmpty) {
      state = state.copyWith(event: const ConnectOrgViewEvent.missingFields());
      return;
    }

    state = state.copyWith(
      isBusy: true,
      event: const ConnectOrgViewEvent.none(),
    );
    try {
      final invitation = await ref
          .read(resolveInvitationUseCaseProvider)
          .execute(serverUrl: serverUrl, code: code);
      state = state.copyWith(
        isBusy: false,
        step: ConnectOrgStep.confirm,
        serverUrl: serverUrl,
        invitationCode: code,
        invitation: invitation,
      );
    } catch (e) {
      state = state.copyWith(
        isBusy: false,
        event: ConnectOrgViewEvent.lookupFailed(e),
      );
    }
  }

  Future<void> onCreatePasskeyTapped() async {
    if (state.isBusy) return;
    final invitation = state.invitation;
    if (invitation == null) return;

    state = state.copyWith(
      isBusy: true,
      step: ConnectOrgStep.registering,
      event: const ConnectOrgViewEvent.none(),
    );

    try {
      // Step 1: passkey ceremony + JWT mint. On failure, roll back to the
      // confirm screen so the user can retry without re-typing anything.
      final profile = await ref
          .read(registerWithPasskeyUseCaseProvider)
          .execute(
            serverUrl: state.serverUrl,
            invitationCode: state.invitationCode,
            displayName: invitation.displayName.isEmpty
                ? null
                : invitation.displayName,
          );

      // Step 2: device registration. Failure here is non-fatal — profile is
      // already saved locally so we still navigate to the list; the user can
      // re-enable notifications from the org row (M4).
      state = state.copyWith(step: ConnectOrgStep.registeringDevice);
      try {
        final fcmToken = await ref.read(fcmTokenProvider.future);
        await ref
            .read(registerDeviceUseCaseProvider)
            .execute(
              profile: profile,
              fcmToken: fcmToken,
              deviceName: _deviceName(),
              locale: _currentLocaleTag(),
            );
        state = state.copyWith(
          isBusy: false,
          event: const ConnectOrgViewEvent.navigateToOrgs(),
        );
      } catch (e) {
        state = state.copyWith(
          isBusy: false,
          event: ConnectOrgViewEvent.deviceRegisterFailed(e),
        );
      }
    } catch (e) {
      state = state.copyWith(
        isBusy: false,
        step: ConnectOrgStep.confirm,
        event: ConnectOrgViewEvent.passkeyFailed(e),
      );
    }
  }

  void onBackToInputTapped() {
    state = state.copyWith(step: ConnectOrgStep.input, invitation: null);
  }

  void onOrgsTapped() {
    state = state.copyWith(event: const ConnectOrgViewEvent.navigateToOrgs());
  }

  void onEventConsumed() =>
      state = state.copyWith(event: const ConnectOrgViewEvent.none());

  String _normalize(String url) {
    if (url.isEmpty) return url;
    if (url.startsWith('http://') || url.startsWith('https://')) return url;
    return 'https://$url';
  }

  String _deviceName() => 'device';

  String _currentLocaleTag() {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    return locale.toLanguageTag();
  }
}
