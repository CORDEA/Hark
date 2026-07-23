import 'package:dio/dio.dart';

import '../../../core/api/api_errors.dart';

/// Talks to a specific Hark server. Constructed with a pre-configured Dio
/// instance from [ApiClientFactory] — the Bearer JWT (if any) is baked into
/// that instance's headers.
class OrgRemoteDataSource {
  OrgRemoteDataSource(this._dio);

  final Dio _dio;

  Future<void> releaseDevice({required String fcmToken}) async {
    final res = await _dio.delete<Map<String, dynamic>>(
      '/api/devices/self',
      data: {'fcm_token': fcmToken},
    );
    // 204 No Content is the success shape — nothing to unwrap.
    if (res.statusCode == 204) return;
    _unwrapData(res.data);
  }

  Future<void> deleteSelf() async {
    try {
      final res = await _dio.delete<Map<String, dynamic>>('/api/self');
      _unwrapData(res.data);
    } on DioException catch (e) {
      final apiError = mapDioError(e);
      if (apiError != null) throw apiError;
      rethrow;
    }
  }
}

/// Every server response uses `{data, error}`. This throws when the envelope
/// carries an error and returns the `data` field on success.
Map<String, dynamic> _unwrapData(Map<String, dynamic>? envelope) {
  if (envelope == null) throw const HarkApiException('empty response');
  final err = envelope['error'];
  if (err is Map<String, dynamic>) {
    throw HarkApiException(
      (err['message'] as String?) ?? 'unknown error',
      code: err['code'] as String?,
    );
  }
  final data = envelope['data'];
  if (data is Map<String, dynamic>) return data;
  return const <String, dynamic>{};
}

class HarkApiException implements Exception {
  const HarkApiException(this.message, {this.code});
  final String message;
  final String? code;

  @override
  String toString() => 'HarkApiException(${code ?? '-'}): $message';
}
