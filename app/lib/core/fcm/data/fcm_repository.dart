import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../logger/app_logger.dart';

part 'fcm_repository.g.dart';

/// Channel ids must match the values the backend stamps into
/// AndroidNotification.channel_id (see backend/internal/services/fcm/fcm.go).
const fcmAndroidChannelWarning = 'hark_alert_warning';
const fcmAndroidChannelCritical = 'hark_alert_critical';

@Riverpod(keepAlive: true)
FcmRepository fcmRepository(Ref ref) =>
    FcmRepository(ref.watch(appLoggerProvider));

class FcmRepository {
  FcmRepository(this._logger);

  final Logger _logger;

  /// Initializes the Firebase SDK. Returns false and logs a warning in local-dev
  /// environments where google-services.json / GoogleService-Info.plist are
  /// absent — the rest of the app still functions with a placeholder token.
  Future<bool> initialize() async {
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }
      return true;
    } catch (e) {
      _logger.w('firebase init skipped', error: e);
      return false;
    }
  }

  Future<void> requestPermission() async {
    try {
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
    } catch (e) {
      _logger.e('fcm permission', error: e);
    }
  }

  Future<String?> getToken() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      _logger.e('fcm token', error: e);
      return null;
    }
  }

  Future<RemoteMessage?> getInitialMessage() async {
    try {
      return await FirebaseMessaging.instance.getInitialMessage();
    } catch (e) {
      _logger.e('fcm initial', error: e);
      return null;
    }
  }

  Stream<RemoteMessage> get onMessage => FirebaseMessaging.onMessage;
  Stream<RemoteMessage> get onMessageOpenedApp =>
      FirebaseMessaging.onMessageOpenedApp;

  /// Registers the Android notification channels the backend routes alerts to.
  /// No-op on non-Android platforms. Channel creation is idempotent, so it is
  /// safe to call this on every launch — subsequent calls only update the
  /// display name/description of an existing channel.
  Future<void> createAndroidAlertChannels({
    required String warningName,
    required String warningDescription,
    required String criticalName,
    required String criticalDescription,
  }) async {
    if (defaultTargetPlatform != TargetPlatform.android) return;
    try {
      final android = FlutterLocalNotificationsPlugin()
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >();
      if (android == null) return;
      await android.createNotificationChannel(
        AndroidNotificationChannel(
          fcmAndroidChannelWarning,
          warningName,
          description: warningDescription,
          importance: Importance.high,
        ),
      );
      await android.createNotificationChannel(
        AndroidNotificationChannel(
          fcmAndroidChannelCritical,
          criticalName,
          description: criticalDescription,
          importance: Importance.max,
        ),
      );
    } catch (e) {
      _logger.e('fcm channels', error: e);
    }
  }
}
