import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/organizations/data/org_profile.dart';

part 'secure_org_store.g.dart';

@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(Ref ref) {
  return const FlutterSecureStorage(
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
}

/// Persists the list of connected organizations as a JSON array in the
/// platform's secure storage. The full list is rewritten on every mutation —
/// this is fine because the list is bounded (a user has a handful of orgs).
@Riverpod(keepAlive: true)
SecureOrgStore secureOrgStore(Ref ref) =>
    SecureOrgStore(ref.watch(secureStorageProvider));

class SecureOrgStore {
  SecureOrgStore(this._storage);

  static const _key = 'hark.orgs';
  final FlutterSecureStorage _storage;

  Future<List<OrgProfile>> readAll() async {
    final raw = await _storage.read(key: _key);
    if (raw == null || raw.isEmpty) return const [];
    final decoded = jsonDecode(raw) as List<dynamic>;
    return decoded
        .map((e) => OrgProfile.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> writeAll(List<OrgProfile> profiles) async {
    final encoded = jsonEncode(profiles.map((p) => p.toJson()).toList());
    await _storage.write(key: _key, value: encoded);
  }
}
