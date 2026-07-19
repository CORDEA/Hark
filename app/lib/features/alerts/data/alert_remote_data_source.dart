import 'package:dio/dio.dart';

import '../../organizations/data/org_remote_data_source.dart'
    show HarkApiException;
import 'alert_dto.dart';

class AlertRemoteDataSource {
  AlertRemoteDataSource(this._dio);

  final Dio _dio;

  Future<AlertDetailDto> getDetail(String alertId) async {
    final res = await _dio.get<Map<String, dynamic>>('/api/alerts/$alertId');
    return AlertDetailDto.fromJson(_unwrapData(res.data));
  }

  Future<RespondAlertResponseDto> respond({
    required String alertId,
    required RespondAlertRequestDto body,
  }) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/api/alerts/$alertId/respond',
      data: body.toJson(),
    );
    return RespondAlertResponseDto.fromJson(_unwrapData(res.data));
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
