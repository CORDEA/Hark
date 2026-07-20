import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/fcm_repository.dart';
import 'initialize_firebase_use_case.dart';

part 'get_fcm_token_use_case.g.dart';

@riverpod
GetFcmTokenUseCase getFcmTokenUseCase(Ref ref) => GetFcmTokenUseCase(
  ref.watch(initializeFirebaseUseCaseProvider),
  ref.watch(fcmRepositoryProvider),
);

class GetFcmTokenUseCase {
  const GetFcmTokenUseCase(this._init, this._repository);
  final InitializeFirebaseUseCase _init;
  final FcmRepository _repository;

  Future<String?> execute() async {
    final available = await _init.execute();
    if (!available) return null;
    return _repository.getToken();
  }
}
