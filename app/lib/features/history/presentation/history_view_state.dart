import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_view_state.freezed.dart';

/// The badge on the right of each row. Encodes the outcome from the local
/// user's perspective (ACK / DECLINED / RESOLVED).
enum HistoryRowBadge { ackedAt, declined, resolved }

@freezed
abstract class HistoryRowViewState with _$HistoryRowViewState {
  const factory HistoryRowViewState({
    required String alertId,
    required String type,
    required DateTime triggeredAt,
    required HistoryRowBadge badge,
    DateTime? badgeAt, // populated for ackedAt
  }) = _HistoryRowViewState;
}

@freezed
sealed class HistoryViewEvent with _$HistoryViewEvent {
  const factory HistoryViewEvent.none() = HistoryViewEventNone;
  const factory HistoryViewEvent.leaveFailed(String reason) =
      HistoryViewEventLeaveFailed;
  const factory HistoryViewEvent.navigateToOrgs() =
      HistoryViewEventNavigateToOrgs;
}

@freezed
abstract class HistoryViewState with _$HistoryViewState {
  const factory HistoryViewState({
    required String orgName,
    required List<HistoryRowViewState> rows,
    @Default(false) bool isLeaving,
    @Default(HistoryViewEvent.none()) HistoryViewEvent event,
  }) = _HistoryViewState;
}
