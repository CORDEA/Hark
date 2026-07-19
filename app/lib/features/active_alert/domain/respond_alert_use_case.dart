import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../alerts/data/alert_dto.dart';
import '../../alerts/data/alert_repository.dart';

part 'respond_alert_use_case.g.dart';

@riverpod
RespondAlertUseCase respondAlertUseCase(Ref ref) =>
    RespondAlertUseCase(ref.watch(alertRepositoryProvider));

class RespondAlertUseCase {
  const RespondAlertUseCase(this._repository);
  final AlertRepository _repository;

  Future<RespondAlertResponseDto> execute({
    required String orgId,
    required String alertId,
    required String action,
  }) {
    return _repository.respond(orgId: orgId, alertId: alertId, action: action);
  }
}
