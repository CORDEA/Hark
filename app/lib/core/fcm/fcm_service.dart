import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'hark_fcm_message.dart';

part 'fcm_service.g.dart';

@Riverpod(keepAlive: true)
FcmService fcmService(Ref ref) {
  final service = FcmService();
  ref.onDispose(service.dispose);
  service.start();
  return service;
}

/// Owns the FirebaseMessaging lifecycle: permissions, initial-message pickup
/// (cold-start from a tapped notification), foreground stream, and onOpenApp.
/// Exposes a single [messages] stream that carries parsed [HarkFcmMessage]s
/// so higher layers don't touch RemoteMessage directly.
class FcmService {
  final _controller = StreamController<HarkFcmMessage>.broadcast();
  final _subscriptions = <StreamSubscription<void>>[];
  bool _started = false;
  bool _firebaseAvailable = false;

  Stream<HarkFcmMessage> get messages => _controller.stream;
  bool get firebaseAvailable => _firebaseAvailable;

  Future<void> start() async {
    if (_started) return;
    _started = true;

    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }
      _firebaseAvailable = true;
    } catch (e) {
      // Missing native firebase config is the expected local-dev state — the
      // rest of the app still functions with the placeholder token.
      debugPrint('firebase init skipped: $e');
      return;
    }

    final messaging = FirebaseMessaging.instance;
    try {
      await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        criticalAlert: true,
      );
    } catch (e) {
      debugPrint('fcm permission: $e');
    }

    // Cold-start: user tapped a system notification and the app launched fresh.
    try {
      final initial = await messaging.getInitialMessage();
      if (initial != null) _emit(initial);
    } catch (e) {
      debugPrint('fcm initial: $e');
    }

    _subscriptions.add(FirebaseMessaging.onMessage.listen(_emit));
    _subscriptions.add(FirebaseMessaging.onMessageOpenedApp.listen(_emit));
  }

  Future<String?> currentToken() async {
    if (!_firebaseAvailable) return null;
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      debugPrint('fcm token: $e');
      return null;
    }
  }

  void _emit(RemoteMessage m) {
    final parsed = HarkFcmMessage.tryParse(m.data);
    if (parsed == null) {
      debugPrint('fcm unknown payload: ${m.data}');
      return;
    }
    _controller.add(parsed);
  }

  Future<void> dispose() async {
    for (final s in _subscriptions) {
      await s.cancel();
    }
    await _controller.close();
  }
}
