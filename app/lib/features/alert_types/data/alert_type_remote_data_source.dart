import 'package:dio/dio.dart';

import '../../organizations/data/org_remote_data_source.dart'
    show HarkApiException;
import 'alert_type_dto.dart';

class AlertTypeRemoteDataSource {
  AlertTypeRemoteDataSource(this._dio);

  final Dio _dio;

  Future<List<AlertTypeDto>> list() async {
    final res = await _dio.get<Map<String, dynamic>>('/api/alert-types');
    final data = _unwrapDataList(res.data);
    return data
        .map((e) => AlertTypeDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

List<dynamic> _unwrapDataList(Map<String, dynamic>? envelope) {
  if (envelope == null) throw const HarkApiException('empty response');
  final err = envelope['error'];
  if (err is Map<String, dynamic>) {
    throw HarkApiException(
      (err['message'] as String?) ?? 'unknown error',
      code: err['code'] as String?,
    );
  }
  final data = envelope['data'];
  if (data is List) return data;
  return const <dynamic>[];
}
