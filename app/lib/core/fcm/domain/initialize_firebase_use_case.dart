import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/fcm_repository.dart';

part 'initialize_firebase_use_case.g.dart';

@Riverpod(keepAlive: true)
InitializeFirebaseUseCase initializeFirebaseUseCase(Ref ref) =>
    InitializeFirebaseUseCase(ref.watch(fcmRepositoryProvider));

class InitializeFirebaseUseCase {
  const InitializeFirebaseUseCase(this._repository);
  final FcmRepository _repository;

  Future<bool> execute() => _repository.initialize();
}
