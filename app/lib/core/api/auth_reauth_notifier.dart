import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_reauth_notifier.g.dart';

/// Set of server URLs whose stored JWT has been rejected by the backend and
/// needs a fresh assertion ceremony before the profile is usable again.
///
/// Populated by [AuthInterceptor] when the server returns 401. Consumed by
/// the org-list view model so a row can render a "Reconnect" affordance
/// instead of pretending the profile is healthy.
@Riverpod(keepAlive: true)
class AuthReauthNotifier extends _$AuthReauthNotifier {
  @override
  Set<String> build() => const {};

  void markStale(String serverUrl) {
    if (state.contains(serverUrl)) return;
    state = {...state, serverUrl};
  }

  void clear(String serverUrl) {
    if (!state.contains(serverUrl)) return;
    final next = {...state}..remove(serverUrl);
    state = next;
  }
}
