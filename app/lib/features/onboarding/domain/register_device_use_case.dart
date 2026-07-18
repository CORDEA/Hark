import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../organizations/data/org_profile.dart';
import '../../organizations/data/org_repository.dart';

part 'register_device_use_case.g.dart';

@riverpod
RegisterDeviceUseCase registerDeviceUseCase(Ref ref) =>
    RegisterDeviceUseCase(ref.watch(orgRepositoryProvider));

class RegisterDeviceUseCase {
  const RegisterDeviceUseCase(this._repository);

  final OrgRepository _repository;

  Future<OrgProfile> execute({
    required String serverUrl,
    required String invitationCode,
    required String fcmToken,
    required String deviceName,
  }) async {
    final profile = await _repository.register(
      serverUrl: serverUrl,
      invitationCode: invitationCode,
      fcmToken: fcmToken,
      deviceName: deviceName,
    );
    await _repository.save(profile);
    return profile;
  }
}
