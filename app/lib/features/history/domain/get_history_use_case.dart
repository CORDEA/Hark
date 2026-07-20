import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../alerts/data/alert_dto.dart';
import '../../alerts/data/alert_repository.dart';

part 'get_history_use_case.g.dart';

@riverpod
GetHistoryUseCase getHistoryUseCase(Ref ref) =>
    GetHistoryUseCase(ref.watch(alertRepositoryProvider));

class GetHistoryUseCase {
  const GetHistoryUseCase(this._repository);
  final AlertRepository _repository;

  Future<List<AlertSummaryDto>> execute({
    required String serverUrl,
    int limit = 50,
  }) => _repository.findAll(serverUrl: serverUrl, limit: limit);
}
