import 'package:dio/dio.dart';

import '../../organizations/data/org_remote_data_source.dart'
    show HarkApiException;
import 'current_user_dto.dart';

class CurrentUserRemoteDataSource {
  CurrentUserRemoteDataSource(this._dio);

  final Dio _dio;

  Future<CurrentUserDto> get() async {
    final res = await _dio.get<Map<String, dynamic>>('/api/me');
    return CurrentUserDto.fromJson(_unwrapData(res.data));
  }
}

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
