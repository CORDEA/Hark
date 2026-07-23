import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../../core/api/api_errors.dart';
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
/// the connected orgs collection. Orgs are identified by [OrgProfile.serverUrl]
/// (one server = one org, per PASSKEY_v2 §0).
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

  Future<void> save(OrgProfile profile) async {
    final all = await _store.readAll();
    final idx = all.indexWhere((p) => p.serverUrl == profile.serverUrl);
    if (idx >= 0) {
      all[idx] = profile;
    } else {
      all.add(profile);
    }
    await _store.writeAll(all);
  }

  Future<void> delete(String serverUrl) async {
    final all = await _store.readAll();
    all.removeWhere((p) => p.serverUrl == serverUrl);
    await _store.writeAll(all);
  }

  /// Removes the org locally in all cases, while reporting whether the
  /// server positively confirmed that its passkey was revoked.
  Future<LeaveOutcome> leave(OrgProfile profile) async {
    var revoked = false;
    try {
      final dio = _apiClientFactory.create(
        profile.serverUrl,
        authToken: profile.authToken,
      );
      final ds = OrgRemoteDataSource(dio);
      // Deleting the user cascades devices as well as credentials.
      await ds.deleteSelf();
      revoked = true;
    } on CredentialRevokedError {
      revoked = true;
    } catch (_) {
      // Swallow — a rotated key or offline network shouldn't trap the user.
    }
    await delete(profile.serverUrl);
    return LeaveOutcome(revoked: revoked);
  }
}

class LeaveOutcome {
  const LeaveOutcome({required this.revoked});

  final bool revoked;
}
