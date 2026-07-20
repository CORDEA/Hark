import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/fcm_repository.dart';

part 'request_notification_permission_use_case.g.dart';

@riverpod
RequestNotificationPermissionUseCase requestNotificationPermissionUseCase(
  Ref ref,
) => RequestNotificationPermissionUseCase(ref.watch(fcmRepositoryProvider));

class RequestNotificationPermissionUseCase {
  const RequestNotificationPermissionUseCase(this._repository);
  final FcmRepository _repository;

  Future<void> execute() => _repository.requestPermission();
}
