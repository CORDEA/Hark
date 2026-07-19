import 'package:app_links/app_links.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';
import 'core/fcm/fcm_background_handler.dart';
import 'core/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final initialRoute = await _detectInitialRoute();

  // Firebase native config is optional in dev — the rest of the app runs
  // without it. When the config is absent the token provider falls back to
  // a placeholder token so the register flow can still be exercised.
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  } catch (e) {
    debugPrint('firebase startup skipped: $e');
  }

  runApp(
    ProviderScope(
      overrides: [initialRouteProvider.overrideWithValue(initialRoute)],
      child: const HarkApp(),
    ),
  );
}

Future<String> _detectInitialRoute() async {
  try {
    final uri = await AppLinks().getInitialLink();
    if (uri != null && uri.scheme == 'hark' && uri.host == 'join') {
      return Uri(
        path: '/connect',
        queryParameters: {
          'server': uri.queryParameters['server'] ?? '',
          'code': uri.queryParameters['code'] ?? '',
        },
      ).toString();
    }
  } catch (e) {
    debugPrint('deep-link initial: $e');
  }
  return '/';
}
