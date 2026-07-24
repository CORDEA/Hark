import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../../core/storage/secure_org_store.dart';
import 'org_profile.dart';
import 'org_remote_data_source.dart';

part 'org_repository.g.dart';

@Riverpod(keepAlive: true)
OrgRepository orgRepository(Ref ref) => OrgRepository(
  ref.watch(secureOrgStoreProvider),
  ref.watch(apiClientFactoryProvider),
);

/// Coordinates local persistence (secure storage) with the remote server for
/// the connected orgs collection. A membership is identified by the pair of
/// [OrgProfile.serverUrl] and [OrgProfile.userId], rather than the host alone.
class OrgRepository {
  const OrgRepository(this._store, this._apiClientFactory);

  final SecureOrgStore _store;
  final ApiClientFactory _apiClientFactory;

  Future<List<OrgProfile>> findAll() => _store.readAll();

  Future<OrgProfile?> findByServerUrl(String serverUrl) async {
    final all = await _store.readAll();
    for (final p in all) {
      if (p.serverUrl == serverUrl) return p;
    }
    return null;
  }

  Future<OrgProfile?> findByMembership(String serverUrl, String userId) async {
    final all = await _store.readAll();
    for (final p in all) {
      if (p.serverUrl == serverUrl && p.userId == userId) return p;
    }
    return null;
  }

  Future<void> save(OrgProfile profile) async {
    final all = await _store.readAll();
    final idx = all.indexWhere(
      (p) => p.serverUrl == profile.serverUrl && p.userId == profile.userId,
    );
    if (idx >= 0) {
      all[idx] = profile;
    } else {
      all.add(profile);
    }
    await _store.writeAll(all);
  }

  Future<void> delete(OrgProfile profile) async {
    final all = await _store.readAll();
    all.removeWhere(
      (p) => p.serverUrl == profile.serverUrl && p.userId == profile.userId,
    );
    await _store.writeAll(all);
  }

  /// Revokes the membership remotely before removing it locally. Keeping the
  /// local record on an error lets the member retry instead of losing control.
  Future<void> leave(OrgProfile profile) async {
    final dio = _apiClientFactory.create(
      profile.serverUrl,
      authToken: profile.authToken,
    );
    final ds = OrgRemoteDataSource(dio);
    // Deleting the user cascades devices and registered credentials.
    await ds.deleteSelf();
    await delete(profile);
  }
}
