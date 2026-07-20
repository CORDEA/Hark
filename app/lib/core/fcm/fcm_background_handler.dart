import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../logger/app_logger.dart';

/// Runs in a separate isolate when a data-only push arrives while the app is
/// terminated. The isolate can't touch the UI — we just log so on next launch
/// the resume flow can pick up the alert from the server.
///
/// Must be a top-level, annotated entry point so tree-shaking preserves it.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  final logger = buildAppLogger();
  try {
    await Firebase.initializeApp();
  } catch (e) {
    logger.e('bg fcm init', error: e);
  }
  logger.d('bg fcm data: ${message.data}');
}
