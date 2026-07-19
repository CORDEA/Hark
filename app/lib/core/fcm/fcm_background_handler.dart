import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

/// Runs in a separate isolate when a data-only push arrives while the app is
/// terminated. The isolate can't touch the UI — we just log so on next launch
/// the resume flow can pick up the alert from the server.
///
/// Must be a top-level, annotated entry point so tree-shaking preserves it.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    await Firebase.initializeApp();
  } catch (e) {
    debugPrint('bg fcm init: $e');
  }
  debugPrint('bg fcm data: ${message.data}');
}
