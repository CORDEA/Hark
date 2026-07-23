import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_detail_view_state.freezed.dart';

/// Row in the detail page's recipient breakdown. The name plus the terminal
/// response and the response timestamp is everything Screen 5 renders.
@freezed
abstract class AlertDetailRecipientViewState
    with _$AlertDetailRecipientViewState {
  const factory AlertDetailRecipientViewState({
    required String name,
    required String responseStatus,
    DateTime? respondedAt,
  }) = _AlertDetailRecipientViewState;
}

/// The caller's own response on the alert. `none` when the caller was not on
/// the recipient list or the request was anonymous (e.g. admin console).
enum AlertDetailMyResponse { none, pending, acknowledged, declined }

@freezed
abstract class AlertDetailViewState with _$AlertDetailViewState {
  const factory AlertDetailViewState({
    required String alertId,
    required String type,
    required String status,
    required String orgName,
    required DateTime triggeredAt,
    DateTime? resolvedAt,
    @Default(<String>[]) List<String> targetNames,
    required bool isBroadcast,
    @Default(AlertDetailMyResponse.none) AlertDetailMyResponse myResponse,
    DateTime? myRespondedAt,
    @Default(<AlertDetailRecipientViewState>[])
    List<AlertDetailRecipientViewState> acknowledged,
    @Default(<AlertDetailRecipientViewState>[])
    List<AlertDetailRecipientViewState> declined,
    @Default(<AlertDetailRecipientViewState>[])
    List<AlertDetailRecipientViewState> pending,
  }) = _AlertDetailViewState;

  const AlertDetailViewState._();

  bool get isCritical => type == 'critical';
  bool get isAcknowledgedByMe =>
      myResponse == AlertDetailMyResponse.acknowledged;
}
