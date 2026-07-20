import 'package:dio/dio.dart';

/// Talks to a specific Hark server. Constructed with a pre-configured Dio
/// instance from [ApiClientFactory] — the Bearer JWT (if any) is baked into
/// that instance's headers.
class OrgRemoteDataSource {
  OrgRemoteDataSource(this._dio);

  final Dio _dio;

  Future<void> leave({required String userId, required String fcmToken}) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/api/users/leave',
      data: {'user_id': userId, 'fcm_token': fcmToken},
    );
    _unwrapData(res.data);
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
