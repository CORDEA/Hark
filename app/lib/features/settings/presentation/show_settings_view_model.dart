import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/fcm/fcm_token_provider.dart';
import '../../organizations/data/org_repository.dart';
import '../../organizations/domain/leave_organization_use_case.dart';
import 'show_settings_view_state.dart';

part 'show_settings_view_model.g.dart';

@riverpod
class ShowSettingsViewModel extends _$ShowSettingsViewModel {
  @override
  ShowSettingsViewState build({required String serverUrl}) =>
      ShowSettingsViewState(orgName: _hostOf(serverUrl));

  Future<void> onLeaveTapped() async {
    if (state.isLeaving) return;
    state = state.copyWith(isLeaving: true);
    try {
      final profile = await ref
          .read(orgRepositoryProvider)
          .findByServerUrl(serverUrl);
      if (profile != null) {
        final fcmToken = await ref.read(fcmTokenProvider.future);
        await ref
            .read(leaveOrganizationUseCaseProvider)
            .execute(profile, fcmToken: fcmToken);
      }
      state = state.copyWith(
        isLeaving: false,
        event: const ShowSettingsViewEvent.navigateToOrgs(),
      );
    } catch (e) {
      state = state.copyWith(
        isLeaving: false,
        event: ShowSettingsViewEvent.leaveFailed(e),
      );
    }
  }

  void onEventConsumed() {
    state = state.copyWith(event: const ShowSettingsViewEvent.none());
  }

  String _hostOf(String url) {
    final u = Uri.tryParse(url);
    if (u == null || u.host.isEmpty) return url;
    return u.host;
  }
}
