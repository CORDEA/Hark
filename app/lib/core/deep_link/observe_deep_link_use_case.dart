import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../logger/app_logger.dart';

part 'observe_deep_link_use_case.freezed.dart';
part 'observe_deep_link_use_case.g.dart';

@freezed
sealed class PendingDeepLink with _$PendingDeepLink {
  const PendingDeepLink._();

  const factory PendingDeepLink.waiting(String route) = PendingDeepLinkWaiting;

  const factory PendingDeepLink.consumed() = PendingDeepLinkConsumed;
}

@Riverpod(keepAlive: true)
AppLinks appLinks(Ref ref) {
  return AppLinks();
}

@Riverpod(keepAlive: true)
class ObserveDeepLinkUseCase extends _$ObserveDeepLinkUseCase {
  final List<StreamSubscription> _subscriptions = [];
  late Logger _logger;

  @override
  PendingDeepLink build() {
    _logger = ref.watch(appLoggerProvider);
    ref.onDispose(() {
      for (final subscription in _subscriptions) {
        subscription.cancel();
      }
    });
    final appLinks = ref.watch(appLinksProvider);
    _subscriptions.add(
      appLinks.uriLinkStream.listen(
        _handle,
        onError: (Object e) => _logger.e('deep-link stream', error: e),
      ),
    );
    _subscriptions.add(
      appLinks.getInitialLink().asStream().listen(
        _handle,
        onError: (Object e) => _logger.e('deep-link initial', error: e),
      ),
    );
    return const PendingDeepLink.consumed();
  }

  /// Universal links land here as `https://<host>/join?code=<code>`. We
  /// treat the origin (`scheme://host[:port]`) as the server URL and
  /// forward the invitation code to the connect wizard.
  void _handle(Uri? uri) {
    if (uri == null) return;
    if (uri.scheme != 'https' && uri.scheme != 'http') return;
    if (uri.path != '/join') return;
    final code = uri.queryParameters['code'] ?? '';
    if (code.isEmpty) return;
    final origin = _origin(uri);
    state = PendingDeepLink.waiting(
      Uri(
        path: '/connect',
        queryParameters: {'server': origin, 'code': code},
      ).toString(),
    );
  }

  String _origin(Uri uri) {
    final port = uri.hasPort ? ':${uri.port}' : '';
    return '${uri.scheme}://${uri.host}$port';
  }

  void consume() {
    state = const PendingDeepLink.consumed();
  }
}
