import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/deep_link/deep_link_service.dart';
import 'core/fcm/fcm_router_bridge.dart';
import 'core/router.dart';
import 'core/theme/app_theme.dart';

class HarkApp extends ConsumerWidget {
  const HarkApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(deepLinkServiceProvider);
    ref.watch(fcmRouterBridgeProvider);
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'Hark',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      routerConfig: router,
    );
  }
}
