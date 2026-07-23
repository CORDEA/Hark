import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/alert_type_dto.dart';
import '../data/alert_type_repository.dart';

part 'get_alert_types_use_case.g.dart';

@riverpod
GetAlertTypesUseCase getAlertTypesUseCase(Ref ref) =>
    GetAlertTypesUseCase(ref.watch(alertTypeRepositoryProvider));

class GetAlertTypesUseCase {
  const GetAlertTypesUseCase(this._repository);
  final AlertTypeRepository _repository;

  Future<List<AlertTypeDto>> execute({required String serverUrl}) =>
      _repository.findAll(serverUrl: serverUrl);
}
