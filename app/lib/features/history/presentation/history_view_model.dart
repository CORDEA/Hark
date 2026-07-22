import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/fcm/fcm_token_provider.dart';
import '../../alerts/data/alert_dto.dart';
import '../../organizations/data/org_repository.dart';
import '../../organizations/domain/leave_organization_use_case.dart';
import '../domain/get_history_use_case.dart';
import 'history_view_state.dart';

part 'history_view_model.g.dart';

@riverpod
class HistoryViewModel extends _$HistoryViewModel {
  @override
  Future<HistoryViewState> build({required String serverUrl}) async {
    final profile = await ref
        .read(orgRepositoryProvider)
        .findByServerUrl(serverUrl);
    if (profile == null) {
      throw StateError('No connected org for server $serverUrl');
    }
    final alerts = await ref
        .watch(getHistoryUseCaseProvider)
        .execute(serverUrl: serverUrl);
    final rows = alerts
        .map((a) => _mapRow(a, profile.userId))
        .whereType<HistoryRowViewState>()
        .toList();
    return HistoryViewState(orgName: _hostOf(serverUrl), rows: rows);
  }

  Future<void> onRefresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> onLeaveTapped() async {
    final current = state.value;
    if (current == null || current.isLeaving) return;
    state = AsyncValue.data(current.copyWith(isLeaving: true));
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
      state = AsyncValue.data(
        current.copyWith(
          isLeaving: false,
          event: const HistoryViewEvent.navigateToOrgs(),
        ),
      );
    } catch (e) {
      state = AsyncValue.data(
        current.copyWith(
          isLeaving: false,
          event: HistoryViewEvent.leaveFailed(e),
        ),
      );
    }
  }

  void onEventConsumed() {
    final current = state.value;
    if (current == null) return;
    state = AsyncValue.data(
      current.copyWith(event: const HistoryViewEvent.none()),
    );
  }

  String _hostOf(String url) {
    final u = Uri.tryParse(url);
    if (u == null || u.host.isEmpty) return url;
    return u.host;
  }
}

HistoryRowViewState? _mapRow(AlertSummaryDto a, String currentUserId) {
  HistoryRowBadge badge;
  DateTime? badgeAt;
  if (a.status == 'resolved') {
    if (a.responderId == currentUserId) {
      badge = HistoryRowBadge.ackedAt;
      badgeAt = a.resolvedAt;
    } else {
      badge = HistoryRowBadge.resolved;
    }
  } else {
    return null;
  }
  return HistoryRowViewState(
    alertId: a.id,
    type: a.type,
    triggeredAt: a.triggeredAt,
    badge: badge,
    badgeAt: badgeAt,
  );
}
