import 'package:dio/dio.dart';

import '../../onboarding/data/register_dto.dart';

/// Talks to a specific Hark server. Constructed with the server URL and a
/// pre-configured Dio instance from [ApiClientFactory].
class OrgRemoteDataSource {
  OrgRemoteDataSource(this._dio);

  final Dio _dio;

  Future<RegisterResponseDto> register(RegisterRequestDto req) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/api/register',
      data: req.toJson(),
    );
    final data = _unwrapData(res.data);
    return RegisterResponseDto.fromJson(data);
  }

  Future<void> leave({required String userId, required String token}) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/api/users/leave',
      data: {'user_id': userId, 'fcm_token': token},
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
