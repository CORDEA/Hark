import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/fcm/domain/observe_fcm_event_use_case.dart';
import '../../alert_detail/domain/get_alert_detail_use_case.dart';
import '../../alert_detail/presentation/alert_detail_view_state.dart';
import '../../alerts/data/alert_dto.dart';
import '../domain/respond_alert_use_case.dart';
import 'active_alert_view_state.dart';

part 'active_alert_view_model.g.dart';

@riverpod
class ActiveAlertViewModel extends _$ActiveAlertViewModel {
  @override
  ActiveAlertViewState build({
    required String alertId,
    required String serverUrl,
    required String type,
    required DateTime triggeredAt,
  }) {
    // The only remote-resolve signal we now honor is an admin resolve —
    // peer acks no longer close the alert on the backend.
    ref.listen(observeFcmEventUseCaseProvider, (_, event) {
      if (event is FcmEventAlertResolved && event.alertId == alertId) {
        _handleRemoteResolve();
      }
      if (event is FcmEventAlertResolved) {
        ref.read(observeFcmEventUseCaseProvider.notifier).consume();
      }
    });

    Future.microtask(_loadRecipients);

    return ActiveAlertViewState(
      alertId: alertId,
      serverUrl: serverUrl,
      type: type,
      triggeredAt: triggeredAt,
    );
  }

  Future<void> onAckTapped() => _respond(RecipientResponse.acknowledged);
  Future<void> onDeclineTapped() => _respond(RecipientResponse.declined);

  void onDismissTapped() {
    state = state.copyWith(event: const ActiveAlertViewEvent.dismiss());
  }

  Future<void> _respond(String action) async {
    if (state.isSending || state.isResolved) return;
    state = state.copyWith(
      isSending: true,
      event: const ActiveAlertViewEvent.none(),
    );
    try {
      await ref
          .read(respondAlertUseCaseProvider)
          .execute(
            serverUrl: state.serverUrl,
            alertId: state.alertId,
            action: action,
          );
      state = state.copyWith(
        isSending: false,
        outcome: action == RecipientResponse.acknowledged
            ? ActiveAlertOutcome.acknowledgedByMe
            : ActiveAlertOutcome.declinedByMe,
      );
      await _loadRecipients();
    } catch (e) {
      state = state.copyWith(
        isSending: false,
        event: ActiveAlertViewEvent.respondFailed(e),
      );
    }
  }

  Future<void> _loadRecipients() async {
    try {
      final detail = await ref
          .read(getAlertDetailUseCaseProvider)
          .execute(serverUrl: state.serverUrl, alertId: state.alertId);
      List<AlertDetailRecipientViewState> filter(String status) => detail
          .recipients
          .where((r) => r.responseStatus == status)
          .map(
            (r) => AlertDetailRecipientViewState(
              name: r.name,
              responseStatus: r.responseStatus,
              respondedAt: r.respondedAt,
            ),
          )
          .toList();
      state = state.copyWith(
        acknowledged: filter(RecipientResponse.acknowledged),
        declined: filter(RecipientResponse.declined),
        pending: filter(RecipientResponse.pending),
      );
    } catch (_) {
      // Recipient list is supplemental — swallow load errors rather than
      // masking the primary ack/decline UX.
    }
  }

  void _handleRemoteResolve() {
    if (state.isResolved) return;
    state = state.copyWith(outcome: ActiveAlertOutcome.resolvedByOther);
  }

  void onEventConsumed() {
    state = state.copyWith(event: const ActiveAlertViewEvent.none());
  }
}
