import 'package:dio/dio.dart';

/// Dio interceptor that attaches a cached Bearer JWT and, on 401, notifies
/// the caller so the profile row can flip to a "Reconnect" state.
///
/// The interceptor deliberately does NOT retry or trigger a re-auth ceremony
/// mid-request. Alert responses must never wait on a biometric prompt
/// (PASSKEY_PLAN §4.5); reconnecting is a user-initiated action driven by
/// the surface that observes [onUnauthorized].
class AuthInterceptor extends Interceptor {
  AuthInterceptor({
    required this.serverUrl,
    required this.authToken,
    required this.onUnauthorized,
  });

  final String serverUrl;
  final String authToken;
  final void Function(String serverUrl) onUnauthorized;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (authToken.isNotEmpty) {
      options.headers['authorization'] = 'Bearer $authToken';
    }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      onUnauthorized(serverUrl);
    }
    handler.next(err);
  }
}
