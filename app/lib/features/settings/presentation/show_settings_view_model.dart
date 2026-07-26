import 'package:hark/core/logger/app_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../organizations/data/org_repository.dart';
import '../../organizations/domain/get_organizations_use_case.dart';
import '../../organizations/domain/leave_organization_use_case.dart';
import 'show_settings_view_state.dart';

part 'show_settings_view_model.g.dart';

@riverpod
class ShowSettingsViewModel extends _$ShowSettingsViewModel {
  @override
  ShowSettingsViewState build({
    required String serverUrl,
    required String userId,
  }) => ShowSettingsViewState(orgName: _hostOf(serverUrl));

  Future<void> onLeaveTapped() async {
    if (state.isLeaving) return;
    state = state.copyWith(isLeaving: true);
    try {
      final profile = await ref
          .read(orgRepositoryProvider)
          .findByMembership(serverUrl, userId);
      if (profile != null) {
        await ref.read(leaveOrganizationUseCaseProvider).execute(profile);
        // The org list may still be cached while this settings page is open.
        // Refresh it before navigating back so the departed org is not shown.
        ref.invalidate(getOrganizationsUseCaseProvider);
        state = state.copyWith(
          isLeaving: false,
          event: const ShowSettingsViewEvent.navigateToOrgs(),
        );
        return;
      }
      state = state.copyWith(
        isLeaving: false,
        event: const ShowSettingsViewEvent.navigateToOrgs(),
      );
    } catch (e, s) {
      ref
          .read(appLoggerProvider)
          .e('Failed to leave organization', error: e, stackTrace: s);
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
