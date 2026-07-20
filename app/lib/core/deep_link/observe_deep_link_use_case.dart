import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  @override
  PendingDeepLink build() {
    ref.onDispose(() {
      for (final subscription in _subscriptions) {
        subscription.cancel();
      }
    });
    final appLinks = ref.watch(appLinksProvider);
    _subscriptions.add(
      appLinks.uriLinkStream.listen(
        _handle,
        onError: (Object e) => debugPrint('deep-link stream: $e'),
      ),
    );
    _subscriptions.add(
      appLinks.getInitialLink().asStream().listen(
        _handle,
        onError: (Object e) => debugPrint('deep-link stream: $e'),
      ),
    );
    return const PendingDeepLink.consumed();
  }

  void _handle(Uri? uri) {
    if (uri == null || uri.scheme != 'hark' || uri.host != 'join') {
      return;
    }
    final server = uri.queryParameters['server'] ?? '';
    final code = uri.queryParameters['code'] ?? '';
    state = PendingDeepLink.waiting(
      Uri(
        path: '/connect',
        queryParameters: {'server': server, 'code': code},
      ).toString(),
    );
  }

  void consume() {
    state = const PendingDeepLink.consumed();
  }
}
