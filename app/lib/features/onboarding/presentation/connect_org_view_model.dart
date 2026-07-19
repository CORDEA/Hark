import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/fcm/fcm_token_provider.dart';
import '../domain/register_device_use_case.dart';
import 'connect_org_view_state.dart';

part 'connect_org_view_model.g.dart';

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

  void onDeviceNameChanged(String value) =>
      state = state.copyWith(deviceName: value);

  Future<void> onSubmitTapped() async {
    if (state.isSubmitting) return;
    final serverUrl = state.serverUrl.trim();
    final code = state.invitationCode.trim();
    if (serverUrl.isEmpty || code.isEmpty) {
      state = state.copyWith(event: const ConnectOrgViewEvent.missingFields());
      return;
    }

    state = state.copyWith(
      isSubmitting: true,
      event: const ConnectOrgViewEvent.none(),
    );
    try {
      final fcmToken = await ref.read(fcmTokenProvider.future);
      await ref
          .read(registerDeviceUseCaseProvider)
          .execute(
            serverUrl: _normalize(serverUrl),
            invitationCode: code,
            fcmToken: fcmToken,
            deviceName: state.deviceName.trim().isEmpty
                ? 'device'
                : state.deviceName.trim(),
            locale: _currentLocaleTag(),
          );
      state = state.copyWith(
        isSubmitting: false,
        event: const ConnectOrgViewEvent.navigateToOrgs(),
      );
    } catch (e) {
      state = state.copyWith(
        isSubmitting: false,
        event: ConnectOrgViewEvent.registerFailed(_prettifyError(e)),
      );
    }
  }

  void onEventConsumed() =>
      state = state.copyWith(event: const ConnectOrgViewEvent.none());

  String _normalize(String url) {
    if (url.startsWith('http://') || url.startsWith('https://')) return url;
    return 'https://$url';
  }

  String _prettifyError(Object err) {
    final s = err.toString();
    if (s.length > 160) return '${s.substring(0, 160)}…';
    return s;
  }

  String _currentLocaleTag() {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    return locale.toLanguageTag();
  }
}
