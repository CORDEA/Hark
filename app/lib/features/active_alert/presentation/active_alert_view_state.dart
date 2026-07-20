import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_alert_view_state.freezed.dart';

/// Terminal state after the user or a teammate resolves the alert.
enum ActiveAlertOutcome {
  /// Local user acknowledged.
  acknowledgedByMe,

  /// Local user declined.
  declinedByMe,

  /// A teammate acked (or admin resolved) before we did — silent-resolve
  /// arrived over FCM.
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
    @Default(ActiveAlertViewEvent.none()) ActiveAlertViewEvent event,
  }) = _ActiveAlertViewState;

  const ActiveAlertViewState._();

  bool get isCritical => type == 'critical';
  bool get isResolved => outcome != null;
}
