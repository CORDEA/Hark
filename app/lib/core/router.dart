import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/onboarding/presentation/connect_org_page.dart';
import '../features/organizations/presentation/list_organization_page.dart';

part 'router.g.dart';

/// A [GlobalKey] on the root [Navigator] so background code (an FCM handler
/// firing from a background isolate, for example) can push the active-alert
/// route without needing a [BuildContext].
final navigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/orgs',
    routes: [
      GoRoute(
        path: '/orgs',
        builder: (context, state) => const ListOrganizationPage(),
      ),
      GoRoute(
        path: '/connect',
        builder: (context, state) {
          final server = state.uri.queryParameters['server'] ?? '';
          final code = state.uri.queryParameters['code'] ?? '';
          return ConnectOrgPage(prefillServerUrl: server, prefillCode: code);
        },
      ),
    ],
  );
}
