import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/fcm/fcm_router_bridge.dart';
import 'core/router.dart';
import 'core/theme/app_theme.dart';
import 'l10n/app_localizations.dart';

class HarkApp extends ConsumerWidget {
  const HarkApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(fcmRouterBridgeProvider);
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: router,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
