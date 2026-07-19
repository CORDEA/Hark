import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/alarm/alarm_service.dart';
import '../../../core/fcm/fcm_router_bridge.dart';
import '../../../core/fcm/hark_fcm_message.dart';
import '../../alerts/data/alert_dto.dart';
import '../domain/respond_alert_use_case.dart';
import 'active_alert_view_state.dart';

part 'active_alert_view_model.g.dart';

@riverpod
class ActiveAlertViewModel extends _$ActiveAlertViewModel {
  StreamSubscription<HarkResolve>? _resolveSub;

  @override
  ActiveAlertViewState build({
    required String alertId,
    required String orgId,
    required String type,
    required DateTime triggeredAt,
  }) {
    // Subscribe to silent-resolve events; if a teammate acks before we do
    // the backend fans out kind=resolve → auto-close the local alarm.
    final bridge = ref.watch(fcmRouterBridgeProvider);
    _resolveSub?.cancel();
    _resolveSub = bridge.resolveEvents.listen((r) {
      if (r.alertId == alertId) _handleRemoteResolve();
    });
    ref.onDispose(() {
      _resolveSub?.cancel();
      // Stop the alarm on any teardown path (nav back, alt route, etc.).
      ref.read(alarmServiceProvider).stop();
    });

    // Fire and forget: raise the alarm for critical alerts as soon as this
    // screen mounts. Non-critical (warning) still shows the emergency UI but
    // without the audio loop.
    if (type == AlertType.critical) {
      Future.microtask(() async {
        await ref.read(alarmServiceProvider).start();
      });
    }

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
    // Silence the local alarm the instant the user commits — waiting for the
    // network round-trip feels awful when a siren is blaring.
    await ref.read(alarmServiceProvider).stop();

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
        event: ActiveAlertViewEvent.showSnackBar('Response failed: $e'),
      );
    }
  }

  void _handleRemoteResolve() {
    if (state.isResolved) return;
    // Fire and forget alarm stop.
    unawaited(ref.read(alarmServiceProvider).stop());
    state = state.copyWith(outcome: ActiveAlertOutcome.resolvedByOther);
  }

  void onEventConsumed() {
    state = state.copyWith(event: const ActiveAlertViewEvent.none());
  }
}
