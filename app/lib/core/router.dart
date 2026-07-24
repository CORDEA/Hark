import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/active_alert/presentation/show_active_alert_page.dart';
import '../features/alert_detail/presentation/view_alert_detail_page.dart';
import '../features/current_user/presentation/list_credentials_page.dart';
import '../features/history/presentation/list_alert_history_page.dart';
import '../features/onboarding/presentation/connect_org_page.dart';
import '../features/organizations/presentation/list_organization_page.dart';
import '../features/settings/presentation/show_settings_page.dart';
import 'deep_link/observe_deep_link_use_case.dart';

part 'router.g.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class _RouterRefreshNotifier extends ChangeNotifier {
  _RouterRefreshNotifier(Ref ref) {
    ref.listen<PendingDeepLink>(observeDeepLinkUseCaseProvider, (_, next) {
      // Only notify for 'waiting' so that consume() called inside redirect
      // doesn't trigger GoRouter's listener synchronously during its own build.
      if (next is PendingDeepLinkWaiting) notifyListeners();
    }, fireImmediately: true);
  }
}

@Riverpod(keepAlive: true)
GoRouter router(Ref ref) {
  return GoRouter(
    navigatorKey: navigatorKey,
    refreshListenable: _RouterRefreshNotifier(ref),
    redirect: (context, state) {
      final deepLink = ref.read(observeDeepLinkUseCaseProvider);
      if (deepLink is PendingDeepLinkWaiting) {
        return deepLink.route;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const ListOrganizationPage(),
        routes: [
          GoRoute(
            path: 'connect',
            builder: (context, state) {
              final server = state.uri.queryParameters['server'] ?? '';
              final code = state.uri.queryParameters['code'] ?? '';
              return ConnectOrgPage(
                prefillServerUrl: server,
                prefillCode: code,
              );
            },
          ),
          GoRoute(
            path: 'orgs/:serverUrl/:userId/history',
            builder: (context, state) {
              final url = Uri.decodeComponent(
                state.pathParameters['serverUrl'] ?? '',
              );
              final userId = Uri.decodeComponent(
                state.pathParameters['userId'] ?? '',
              );
              return ListAlertHistoryPage(serverUrl: url, userId: userId);
            },
          ),
          GoRoute(
            path: 'orgs/:serverUrl/:userId/credentials',
            builder: (context, state) {
              final url = Uri.decodeComponent(
                state.pathParameters['serverUrl'] ?? '',
              );
              final userId = Uri.decodeComponent(
                state.pathParameters['userId'] ?? '',
              );
              return ListCredentialsPage(serverUrl: url, userId: userId);
            },
          ),
          GoRoute(
            path: 'orgs/:serverUrl/:userId/settings',
            builder: (context, state) {
              final url = Uri.decodeComponent(
                state.pathParameters['serverUrl'] ?? '',
              );
              final userId = Uri.decodeComponent(
                state.pathParameters['userId'] ?? '',
              );
              return ShowSettingsPage(serverUrl: url, userId: userId);
            },
          ),
          GoRoute(
            path: 'orgs/:serverUrl/alert/:id',
            builder: (context, state) {
              final id = state.pathParameters['id'] ?? '';
              final url = Uri.decodeComponent(
                state.pathParameters['serverUrl'] ?? '',
              );
              final type = state.uri.queryParameters['type'] ?? '';
              return ShowActiveAlertPage(
                alertId: id,
                serverUrl: url,
                type: type,
              );
            },
            routes: [
              GoRoute(
                path: 'detail',
                builder: (context, state) {
                  final id = state.pathParameters['id'] ?? '';
                  final url = Uri.decodeComponent(
                    state.pathParameters['serverUrl'] ?? '',
                  );
                  return ViewAlertDetailPage(serverUrl: url, alertId: id);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
