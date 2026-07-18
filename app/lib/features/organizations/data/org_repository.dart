import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../../core/storage/secure_org_store.dart';
import '../../onboarding/data/register_dto.dart';
import 'org_profile.dart';
import 'org_remote_data_source.dart';

part 'org_repository.g.dart';

@Riverpod(keepAlive: true)
OrgRepository orgRepository(Ref ref) => OrgRepository(
  ref.watch(secureOrgStoreProvider),
  ref.watch(apiClientFactoryProvider),
);

/// Coordinates local persistence (secure storage) with the remote server for
/// the connected orgs collection.
class OrgRepository {
  const OrgRepository(this._store, this._apiClientFactory);

  final SecureOrgStore _store;
  final ApiClientFactory _apiClientFactory;

  Future<List<OrgProfile>> findAll() => _store.readAll();

  Future<OrgProfile?> findById(String orgId) async {
    final all = await _store.readAll();
    for (final p in all) {
      if (p.orgId == orgId) return p;
    }
    return null;
  }

  Future<void> save(OrgProfile profile) async {
    final all = await _store.readAll();
    final idx = all.indexWhere((p) => p.orgId == profile.orgId);
    if (idx >= 0) {
      all[idx] = profile;
    } else {
      all.add(profile);
    }
    await _store.writeAll(all);
  }

  Future<void> delete(String orgId) async {
    final all = await _store.readAll();
    all.removeWhere((p) => p.orgId == orgId);
    await _store.writeAll(all);
  }

  /// Registers this device with a Hark server. Returns the fresh profile;
  /// caller is responsible for calling [save] to persist it.
  Future<OrgProfile> register({
    required String serverUrl,
    required String invitationCode,
    required String fcmToken,
    required String deviceName,
  }) async {
    final dio = _apiClientFactory.create(serverUrl);
    final ds = OrgRemoteDataSource(dio);
    final res = await ds.register(
      RegisterRequestDto(
        invitationCode: invitationCode,
        fcmToken: fcmToken,
        deviceName: deviceName,
      ),
    );
    return OrgProfile(
      orgId: res.orgId,
      orgName: res.orgName,
      serverUrl: serverUrl,
      userId: res.userId,
      token: fcmToken,
    );
  }

  /// Best-effort call to release the device on the server, then removes the
  /// org locally regardless of network outcome so the user isn't stuck.
  Future<void> leave(OrgProfile profile) async {
    try {
      final dio = _apiClientFactory.create(profile.serverUrl);
      final ds = OrgRemoteDataSource(dio);
      await ds.leave(userId: profile.userId, token: profile.token);
    } catch (_) {
      // Swallow — a rotated key or offline network shouldn't trap the user.
    }
    await delete(profile.orgId);
  }
}
