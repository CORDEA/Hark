import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app.dart';
import 'core/fcm/fcm_background_handler.dart';
import 'core/logger/app_logger.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Firebase native config is optional in dev — the rest of the app runs
  // without it. When the config is absent the token provider falls back to
  // a placeholder token so the register flow can still be exercised.
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  } catch (e) {
    buildAppLogger().w('firebase startup skipped', error: e);
  }
  runApp(ProviderScope(child: const HarkApp()));
}
