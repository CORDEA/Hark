import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/fcm/domain/observe_fcm_event_use_case.dart';
import 'core/router.dart';
import 'core/theme/app_theme.dart';
import 'l10n/app_localizations.dart';

class HarkApp extends ConsumerWidget {
  const HarkApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(observeFcmEventUseCaseProvider, (_, event) {
      switch (event) {
        case FcmEventAlertArrived(:final route):
          navigatorKey.currentContext?.push(route);
          ref.read(observeFcmEventUseCaseProvider.notifier).consume();
        case FcmEventTest():
          ref.read(observeFcmEventUseCaseProvider.notifier).consume();
        case FcmEventAlertResolved():
        case FcmEventNone():
          break;
      }
    });
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
