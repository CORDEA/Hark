import 'package:freezed_annotation/freezed_annotation.dart';

part 'invitation_lookup_dto.freezed.dart';
part 'invitation_lookup_dto.g.dart';

/// Payload of `GET /api/invitations/{code}`. Used by the confirmation step
/// before we ask the user to create a passkey.
@freezed
abstract class InvitationLookupDto with _$InvitationLookupDto {
  const factory InvitationLookupDto({
    required String code,
    @JsonKey(name: 'display_name') @Default('') String displayName,
    required String kind,
    @JsonKey(name: 'expires_at') required DateTime expiresAt,
    @JsonKey(name: 'org_name') required String orgName,
    @JsonKey(name: 'server_url') required String serverUrl,
  }) = _InvitationLookupDto;

  factory InvitationLookupDto.fromJson(Map<String, dynamic> json) =>
      _$InvitationLookupDtoFromJson(json);
}
