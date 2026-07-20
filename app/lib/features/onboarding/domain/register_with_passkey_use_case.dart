import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../../core/webauthn/passkey_service.dart';
import '../../organizations/data/org_profile.dart';
import '../../organizations/data/org_repository.dart';
import '../data/webauthn_remote_data_source.dart';

part 'register_with_passkey_use_case.g.dart';

@riverpod
RegisterWithPasskeyUseCase registerWithPasskeyUseCase(Ref ref) =>
    RegisterWithPasskeyUseCase(
      ref.watch(apiClientFactoryProvider),
      ref.watch(passkeyServiceProvider),
      ref.watch(orgRepositoryProvider),
    );

/// Runs the full WebAuthn ceremony for a new-user invitation:
///
/// 1. begin — fetch creation options from the server
/// 2. platform passkey UI — user approves; authenticator produces attestation
/// 3. finish — server verifies, creates user+credential, mints JWT
/// 4. persist the slim [OrgProfile] locally
///
/// Device registration is a separate step (see [RegisterDeviceUseCase]) so
/// the caller can surface a clear failure mode when the passkey works but
/// the FCM registration doesn't.
class RegisterWithPasskeyUseCase {
  const RegisterWithPasskeyUseCase(
    this._apiClientFactory,
    this._passkeyService,
    this._orgs,
  );

  final ApiClientFactory _apiClientFactory;
  final PasskeyService _passkeyService;
  final OrgRepository _orgs;

  Future<OrgProfile> execute({
    required String serverUrl,
    required String invitationCode,
    String? displayName,
  }) async {
    final dio = _apiClientFactory.create(serverUrl);
    final ds = WebAuthnRemoteDataSource(dio);

    final options = await ds.registerBegin(
      invitationCode: invitationCode,
      displayName: displayName,
    );
    final attestation = await _passkeyService.createCredential(options);
    final finish = await ds.registerFinish(
      invitationCode: invitationCode,
      attestation: attestation,
    );

    final profile = OrgProfile(
      serverUrl: serverUrl,
      userId: finish.userId,
      authToken: finish.authToken,
    );
    await _orgs.save(profile);
    return profile;
  }
}
