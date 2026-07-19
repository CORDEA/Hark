import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'alarm_service.g.dart';

@Riverpod(keepAlive: true)
AlarmService alarmService(Ref ref) {
  final service = AlarmService();
  ref.onDispose(service.stop);
  return service;
}

/// Thin wrapper over the native `hark/alarm` platform channel. Native code is
/// responsible for the actual audio + haptic loop; Dart just tells it when to
/// begin and end. Calls are best-effort — failure to raise the alarm should
/// not crash the ack/decline flow.
class AlarmService {
  static const _channel = MethodChannel('hark/alarm');
  bool _running = false;

  bool get isRunning => _running;

  Future<void> start() async {
    if (_running) return;
    _running = true;
    try {
      await _channel.invokeMethod<void>('startCriticalAlarm');
    } catch (e) {
      debugPrint('alarm start: $e');
    }
  }

  Future<void> stop() async {
    if (!_running) return;
    _running = false;
    try {
      await _channel.invokeMethod<void>('stopAlarm');
    } catch (e) {
      debugPrint('alarm stop: $e');
    }
  }
}
