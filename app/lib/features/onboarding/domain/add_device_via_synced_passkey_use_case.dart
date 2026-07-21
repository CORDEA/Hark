import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../../core/webauthn/passkey_service.dart';
import '../../organizations/data/org_profile.dart';
import '../../organizations/data/org_repository.dart';
import '../data/webauthn_remote_data_source.dart';

part 'add_device_via_synced_passkey_use_case.g.dart';

@riverpod
AddDeviceViaSyncedPasskeyUseCase addDeviceViaSyncedPasskeyUseCase(Ref ref) =>
    AddDeviceViaSyncedPasskeyUseCase(
      ref.watch(apiClientFactoryProvider),
      ref.watch(passkeyServiceProvider),
      ref.watch(orgRepositoryProvider),
    );

/// Runs the discoverable-credential assertion ceremony ("Path A" in
/// PASSKEY_PLAN §2.2): the user names only the server, the platform
/// authenticator picks a synced passkey for that RP ID, and the server
/// mints a fresh JWT against the credential's owner.
class AddDeviceViaSyncedPasskeyUseCase {
  const AddDeviceViaSyncedPasskeyUseCase(
    this._apiClientFactory,
    this._passkeyService,
    this._orgs,
  );

  final ApiClientFactory _apiClientFactory;
  final PasskeyService _passkeyService;
  final OrgRepository _orgs;

  Future<OrgProfile> execute({required String serverUrl}) async {
    final dio = _apiClientFactory.create(serverUrl);
    final ds = WebAuthnRemoteDataSource(dio);

    final options = await ds.assertionBegin();
    final assertion = await _passkeyService.assertCredential(options);

    final challenge = (options['challenge'] as String?) ?? '';
    final finish = await ds.assertionFinish(
      challenge: challenge,
      assertion: assertion,
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
