import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../alerts/data/alert_dto.dart';
import '../../organizations/data/org_repository.dart';
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
    final ongoing = <HistoryRowViewState>[];
    final history = <HistoryRowViewState>[];
    for (final a in alerts) {
      final row = _mapRow(a, profile.userId);
      if (a.status == 'resolved') {
        history.add(row);
      } else {
        ongoing.add(row);
      }
    }
    ongoing.sort((a, b) {
      final byType = _typeRank(a.type).compareTo(_typeRank(b.type));
      if (byType != 0) return byType;
      return b.triggeredAt.compareTo(a.triggeredAt);
    });
    history.sort((a, b) => b.triggeredAt.compareTo(a.triggeredAt));
    return HistoryViewState(
      orgName: _hostOf(serverUrl),
      ongoingRows: ongoing,
      historyRows: history,
    );
  }

  Future<void> onRefresh() async {
    ref.invalidateSelf();
    await future;
  }

  String _hostOf(String url) {
    final u = Uri.tryParse(url);
    if (u == null || u.host.isEmpty) return url;
    return u.host;
  }
}

int _typeRank(String type) => type == AlertType.critical ? 0 : 1;

HistoryRowViewState _mapRow(AlertSummaryDto a, String currentUserId) {
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
    badge = HistoryRowBadge.ongoing;
  }
  return HistoryRowViewState(
    alertId: a.id,
    type: a.type,
    triggeredAt: a.triggeredAt,
    badge: badge,
    badgeAt: badgeAt,
  );
}
