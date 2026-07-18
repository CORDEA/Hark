import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

/// Builds a Dio client aimed at a specific org's server URL. Each org can
/// point at a different Hark deployment so we don't share a single global
/// client — callers pass in the base URL.
@Riverpod(keepAlive: true)
ApiClientFactory apiClientFactory(Ref ref) => const ApiClientFactory();

class ApiClientFactory {
  const ApiClientFactory();

  Dio create(String baseUrl) {
    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 8),
        receiveTimeout: const Duration(seconds: 12),
        headers: {'content-type': 'application/json'},
        responseType: ResponseType.json,
      ),
    );
  }
}
