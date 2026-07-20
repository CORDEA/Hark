import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/fcm/domain/observe_fcm_event_use_case.dart';
import '../../alerts/data/alert_dto.dart';
import '../domain/respond_alert_use_case.dart';
import 'active_alert_view_state.dart';

part 'active_alert_view_model.g.dart';

@riverpod
class ActiveAlertViewModel extends _$ActiveAlertViewModel {
  @override
  ActiveAlertViewState build({
    required String alertId,
    required String orgId,
    required String type,
    required DateTime triggeredAt,
  }) {
    // Subscribe to silent-resolve events so a teammate's ack auto-closes this screen.
    ref.listen(observeFcmEventUseCaseProvider, (_, event) {
      if (event is FcmEventAlertResolved && event.alertId == alertId) {
        _handleRemoteResolve();
      }
      // Consume any resolve event regardless of alertId — no other handler will.
      if (event is FcmEventAlertResolved) {
        ref.read(observeFcmEventUseCaseProvider.notifier).consume();
      }
    });

    return ActiveAlertViewState(
      alertId: alertId,
      orgId: orgId,
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
          .execute(orgId: state.orgId, alertId: state.alertId, action: action);
      state = state.copyWith(
        isSending: false,
        outcome: action == RecipientResponse.acknowledged
            ? ActiveAlertOutcome.acknowledgedByMe
            : ActiveAlertOutcome.declinedByMe,
      );
    } catch (e) {
      state = state.copyWith(
        isSending: false,
        event: ActiveAlertViewEvent.respondFailed(e),
      );
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
