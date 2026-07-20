// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_lookup_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvitationLookupDto _$InvitationLookupDtoFromJson(Map<String, dynamic> json) =>
    _InvitationLookupDto(
      code: json['code'] as String,
      displayName: json['display_name'] as String? ?? '',
      kind: json['kind'] as String,
      expiresAt: DateTime.parse(json['expires_at'] as String),
      orgName: json['org_name'] as String,
      serverUrl: json['server_url'] as String,
    );

Map<String, dynamic> _$InvitationLookupDtoToJson(
  _InvitationLookupDto instance,
) => <String, dynamic>{
  'code': instance.code,
  'display_name': instance.displayName,
  'kind': instance.kind,
  'expires_at': instance.expiresAt.toIso8601String(),
  'org_name': instance.orgName,
  'server_url': instance.serverUrl,
};
