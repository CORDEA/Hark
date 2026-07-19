import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../router.dart';

part 'deep_link_service.g.dart';

@Riverpod(keepAlive: true)
DeepLinkService deepLinkService(Ref ref) {
  final service = DeepLinkService();
  ref.onDispose(service.dispose);
  service.start();
  return service;
}

/// Listens for `hark://join?server=<url>&code=<code>` warm-start links
/// and routes to /connect with the fields pre-filled.
/// Cold-start handling is done in main() via [initialRouteProvider].
class DeepLinkService {
  DeepLinkService() : _appLinks = AppLinks();

  final AppLinks _appLinks;
  StreamSubscription<Uri>? _sub;

  void start() {
    _sub = _appLinks.uriLinkStream.listen(
      _handle,
      onError: (Object e) => debugPrint('deep-link stream: $e'),
    );
  }

  void _handle(Uri uri) {
    if (uri.scheme != 'hark' || uri.host != 'join') return;
    final server = uri.queryParameters['server'] ?? '';
    final code = uri.queryParameters['code'] ?? '';
    final location = Uri(
      path: '/connect',
      queryParameters: {'server': server, 'code': code},
    ).toString();
    navigatorKey.currentContext?.go(location);
  }

  Future<void> dispose() async {
    await _sub?.cancel();
  }
}
