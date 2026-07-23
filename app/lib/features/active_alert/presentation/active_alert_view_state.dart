import 'package:freezed_annotation/freezed_annotation.dart';

import '../../alert_detail/presentation/alert_detail_view_state.dart';

part 'active_alert_view_state.freezed.dart';

/// Terminal state after the user resolves the alert locally (by ack/decline)
/// or after the admin resolves it server-side.
enum ActiveAlertOutcome {
  /// Local user acknowledged.
  acknowledgedByMe,

  /// Local user declined.
  declinedByMe,

  /// Admin resolved the alert while we were still viewing it — a
  /// silent-resolve FCM message arrived from the backend.
  resolvedByOther,
}

@freezed
sealed class ActiveAlertViewEvent with _$ActiveAlertViewEvent {
  const factory ActiveAlertViewEvent.none() = ActiveAlertViewEventNone;
  const factory ActiveAlertViewEvent.respondFailed(Object error) =
      ActiveAlertViewEventRespondFailed;
  const factory ActiveAlertViewEvent.dismiss() = ActiveAlertViewEventDismiss;
}

@freezed
abstract class ActiveAlertViewState with _$ActiveAlertViewState {
  const factory ActiveAlertViewState({
    required String alertId,
    required String serverUrl,
    required String type,
    required DateTime triggeredAt,
    @Default(false) bool isSending,
    ActiveAlertOutcome? outcome,
    String? resolvedByName,
    @Default(<AlertDetailRecipientViewState>[])
    List<AlertDetailRecipientViewState> acknowledged,
    @Default(<AlertDetailRecipientViewState>[])
    List<AlertDetailRecipientViewState> declined,
    @Default(<AlertDetailRecipientViewState>[])
    List<AlertDetailRecipientViewState> pending,
    @Default(ActiveAlertViewEvent.none()) ActiveAlertViewEvent event,
  }) = _ActiveAlertViewState;

  const ActiveAlertViewState._();

  bool get isResolved => outcome != null;
}
