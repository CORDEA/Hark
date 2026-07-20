// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrgProfile _$OrgProfileFromJson(Map<String, dynamic> json) => _OrgProfile(
  serverUrl: json['server_url'] as String,
  userId: json['user_id'] as String,
  authToken: json['auth_token'] as String,
);

Map<String, dynamic> _$OrgProfileToJson(_OrgProfile instance) =>
    <String, dynamic>{
      'server_url': instance.serverUrl,
      'user_id': instance.userId,
      'auth_token': instance.authToken,
    };
