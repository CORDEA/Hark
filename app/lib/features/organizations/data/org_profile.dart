import 'package:freezed_annotation/freezed_annotation.dart';

part 'org_profile.freezed.dart';
part 'org_profile.g.dart';

/// One row in the local list of connected organizations. Persisted as JSON in
/// secure storage under `hark.orgs` — see [SecureOrgStore].
@freezed
abstract class OrgProfile with _$OrgProfile {
  const factory OrgProfile({
    required String orgId,
    required String orgName,
    required String serverUrl,
    required String userId,
    required String token,
  }) = _OrgProfile;

  factory OrgProfile.fromJson(Map<String, dynamic> json) =>
      _$OrgProfileFromJson(json);
}
