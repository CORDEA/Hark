import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../hark_fcm_message.dart';
import 'observe_fcm_messages_use_case.dart';

part 'observe_fcm_event_use_case.freezed.dart';
part 'observe_fcm_event_use_case.g.dart';

@freezed
sealed class FcmEvent with _$FcmEvent {
  const FcmEvent._();

  const factory FcmEvent.none() = FcmEventNone;

  /// An alert arrived — route is the fully-formed GoRouter path to push.
  const factory FcmEvent.alertArrived(String route) = FcmEventAlertArrived;

  /// The backend resolved an alert identified by [alertId].
  const factory FcmEvent.alertResolved(String alertId) = FcmEventAlertResolved;

  /// A test ping from the backend — no action required.
  const factory FcmEvent.test() = FcmEventTest;
}

@Riverpod(keepAlive: true)
class ObserveFcmEventUseCase extends _$ObserveFcmEventUseCase {
  StreamSubscription<HarkFcmMessage>? _sub;

  @override
  FcmEvent build() {
    final useCase = ref.watch(observeFcmMessagesUseCaseProvider);
    _sub?.cancel();
    _sub = useCase.messages.listen(_handle);
    ref.onDispose(() => _sub?.cancel());
    return const FcmEvent.none();
  }

  void _handle(HarkFcmMessage msg) {
    switch (msg) {
      case HarkAlert(:final alertId, :final serverUrl, :final type):
        state = FcmEvent.alertArrived(
          Uri(
            path: '/orgs/${Uri.encodeComponent(serverUrl)}/alert/$alertId',
            queryParameters: {'type': type},
          ).toString(),
        );
      case HarkResolve(:final alertId):
        state = FcmEvent.alertResolved(alertId);
      case HarkTest():
        state = const FcmEvent.test();
    }
  }

  void consume() {
    state = const FcmEvent.none();
  }
}
