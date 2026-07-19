import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/active_alert/presentation/show_active_alert_page.dart';
import '../features/alert_detail/presentation/view_alert_detail_page.dart';
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
      GoRoute(
        path: '/alert/:id',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          final org = state.uri.queryParameters['org'] ?? '';
          final type = state.uri.queryParameters['type'] ?? 'critical';
          return ShowActiveAlertPage(alertId: id, orgId: org, type: type);
        },
      ),
      GoRoute(
        path: '/alert/:id/detail',
        builder: (context, state) {
          final id = state.pathParameters['id'] ?? '';
          final org = state.uri.queryParameters['org'] ?? '';
          return ViewAlertDetailPage(orgId: org, alertId: id);
        },
      ),
    ],
  );
}
