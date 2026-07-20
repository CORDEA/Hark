import 'package:freezed_annotation/freezed_annotation.dart';

part 'org_profile.freezed.dart';
part 'org_profile.g.dart';

/// One row in the local list of connected organizations. Persisted as JSON in
/// secure storage under `hark.orgs` — see [SecureOrgStore]. Shape is verbatim
/// per PASSKEY_v2 §2: only login credentials live here. Org name, devices,
/// and everything else are fetched from `/api/me` on demand.
@freezed
abstract class OrgProfile with _$OrgProfile {
  const factory OrgProfile({
    @JsonKey(name: 'server_url') required String serverUrl,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'auth_token') required String authToken,
  }) = _OrgProfile;

  factory OrgProfile.fromJson(Map<String, dynamic> json) =>
      _$OrgProfileFromJson(json);
}
