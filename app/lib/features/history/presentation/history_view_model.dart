import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../alerts/data/alert_dto.dart';
import '../../organizations/data/org_repository.dart';
import '../../organizations/domain/leave_organization_use_case.dart';
import '../domain/get_history_use_case.dart';
import 'history_view_state.dart';

part 'history_view_model.g.dart';

@riverpod
class HistoryViewModel extends _$HistoryViewModel {
  @override
  Future<HistoryViewState> build({required String orgId}) async {
    final profile = await ref.read(orgRepositoryProvider).findById(orgId);
    if (profile == null) {
      throw StateError('No connected org for id $orgId');
    }
    final alerts = await ref
        .watch(getHistoryUseCaseProvider)
        .execute(orgId: orgId);
    final rows = alerts
        .map((a) => _mapRow(a, profile.userId))
        .whereType<HistoryRowViewState>()
        .toList();
    return HistoryViewState(orgName: profile.orgName, rows: rows);
  }

  Future<void> onLeaveTapped() async {
    final current = state.value;
    if (current == null || current.isLeaving) return;
    state = AsyncValue.data(current.copyWith(isLeaving: true));
    try {
      final profile = await ref
          .read(orgRepositoryProvider)
          .findById(_orgIdArg());
      if (profile != null) {
        await ref.read(leaveOrganizationUseCaseProvider).execute(profile);
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

  String _orgIdArg() => orgId;
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
    // Active alerts don't belong in the history log — they're on the
    // active-alert screen. Filter out.
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
