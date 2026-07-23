import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../organizations/data/org_repository.dart';
import '../../organizations/domain/leave_organization_use_case.dart';
import '../../organizations/presentation/passkey_cleanup_notice_dialog.dart';
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
        final outcome = await ref
            .read(leaveOrganizationUseCaseProvider)
            .execute(profile);
        state = state.copyWith(
          isLeaving: false,
          event: ShowSettingsViewEvent.showPasskeyCleanupNotice(
            reason: outcome.revoked
                ? PasskeyRevocationReason.leftByUser
                : PasskeyRevocationReason.leftOffline,
            orgDisplayName: state.orgName,
            serverUrl: serverUrl,
          ),
        );
        return;
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

  void onPasskeyCleanupNoticeDismissed() {
    state = state.copyWith(event: const ShowSettingsViewEvent.navigateToOrgs());
  }

  String _hostOf(String url) {
    final u = Uri.tryParse(url);
    if (u == null || u.host.isEmpty) return url;
    return u.host;
  }
}
