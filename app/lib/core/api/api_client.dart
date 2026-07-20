import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

/// Builds a Dio client aimed at a specific org's server URL. Each org can
/// point at a different Hark deployment so we don't share a single global
/// client — callers pass in the base URL and, optionally, the JWT to attach
/// on every request.
@Riverpod(keepAlive: true)
ApiClientFactory apiClientFactory(Ref ref) => const ApiClientFactory();

class ApiClientFactory {
  const ApiClientFactory();

  Dio create(String baseUrl, {String? authToken}) {
    final headers = <String, String>{'content-type': 'application/json'};
    if (authToken != null && authToken.isNotEmpty) {
      headers['authorization'] = 'Bearer $authToken';
    }
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 12),
        headers: headers,
        responseType: ResponseType.json,
      ),
    );
  }
}
