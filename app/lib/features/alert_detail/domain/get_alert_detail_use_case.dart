import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../alerts/data/alert_dto.dart';
import '../../alerts/data/alert_repository.dart';

part 'get_alert_detail_use_case.g.dart';

@riverpod
GetAlertDetailUseCase getAlertDetailUseCase(Ref ref) =>
    GetAlertDetailUseCase(ref.watch(alertRepositoryProvider));

class GetAlertDetailUseCase {
  const GetAlertDetailUseCase(this._repository);
  final AlertRepository _repository;

  Future<AlertDetailDto> execute({
    required String serverUrl,
    required String alertId,
  }) {
    return _repository.findById(serverUrl: serverUrl, alertId: alertId);
  }
}
