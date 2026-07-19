import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../router.dart';
import 'fcm_service.dart';
import 'hark_fcm_message.dart';

part 'fcm_router_bridge.g.dart';

/// Listens on [FcmService.messages] and routes to /alert/:id whenever an
/// alert lands. Resolve/test payloads are broadcast on [resolveEvents] /
/// [testEvents] for the active-alert screen and any future subscribers.
@Riverpod(keepAlive: true)
FcmRouterBridge fcmRouterBridge(Ref ref) {
  final service = ref.watch(fcmServiceProvider);
  final bridge = FcmRouterBridge(service);
  ref.onDispose(bridge.dispose);
  bridge.start();
  return bridge;
}

class FcmRouterBridge {
  FcmRouterBridge(this._service);

  final FcmService _service;
  final _resolveController = StreamController<HarkResolve>.broadcast();
  final _testController = StreamController<HarkTest>.broadcast();
  StreamSubscription<HarkFcmMessage>? _sub;

  Stream<HarkResolve> get resolveEvents => _resolveController.stream;
  Stream<HarkTest> get testEvents => _testController.stream;

  void start() {
    _sub = _service.messages.listen(_handle);
  }

  void _handle(HarkFcmMessage msg) {
    switch (msg) {
      case HarkAlert(:final alertId, :final orgId, :final type):
        navigatorKey.currentContext?.push(
          Uri(
            path: '/alert/$alertId',
            queryParameters: {'org': orgId, 'type': type},
          ).toString(),
        );
      case HarkResolve():
        _resolveController.add(msg);
      case HarkTest():
        _testController.add(msg);
    }
  }

  Future<void> dispose() async {
    await _sub?.cancel();
    await _resolveController.close();
    await _testController.close();
  }
}
