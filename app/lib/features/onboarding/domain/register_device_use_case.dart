import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../organizations/data/org_profile.dart';
import '../data/webauthn_remote_data_source.dart';

part 'register_device_use_case.g.dart';

@riverpod
RegisterDeviceUseCase registerDeviceUseCase(Ref ref) =>
    RegisterDeviceUseCase(ref.watch(apiClientFactoryProvider));

/// Registers this device's FCM token against an authenticated Hark server.
/// The returned device_id is not persisted — the server resolves the device
/// by (user_id, fcm_token) on future calls (see PASSKEY_PLAN §2.4).
class RegisterDeviceUseCase {
  const RegisterDeviceUseCase(this._apiClientFactory);

  final ApiClientFactory _apiClientFactory;

  Future<void> execute({
    required OrgProfile profile,
    required String fcmToken,
    required String deviceName,
    required String locale,
  }) async {
    final dio = _apiClientFactory.create(
      profile.serverUrl,
      authToken: profile.authToken,
    );
    final ds = WebAuthnRemoteDataSource(dio);
    await ds.registerDevice(
      fcmToken: fcmToken,
      deviceName: deviceName,
      locale: locale,
    );
  }
}
