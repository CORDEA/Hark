import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_interceptor.dart';
import 'auth_reauth_notifier.dart';

part 'api_client.g.dart';

/// Builds a Dio client aimed at a specific org's server URL. Each org can
/// point at a different Hark deployment so we don't share a single global
/// client — callers pass in the base URL and, optionally, the JWT to attach
/// on every request.
@Riverpod(keepAlive: true)
ApiClientFactory apiClientFactory(Ref ref) => ApiClientFactory(ref);

class ApiClientFactory {
  const ApiClientFactory(this._ref);

  final Ref _ref;

  Dio create(String baseUrl, {String? authToken}) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 12),
        headers: const {'content-type': 'application/json'},
        responseType: ResponseType.json,
      ),
    );
    if (authToken != null && authToken.isNotEmpty) {
      dio.interceptors.add(
        AuthInterceptor(
          serverUrl: baseUrl,
          authToken: authToken,
          onUnauthorized: (url) =>
              _ref.read(authReauthProvider.notifier).markStale(url),
        ),
      );
    }
    return dio;
  }
}
