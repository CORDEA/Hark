// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrgProfile _$OrgProfileFromJson(Map<String, dynamic> json) => _OrgProfile(
  orgId: json['orgId'] as String,
  orgName: json['orgName'] as String,
  serverUrl: json['serverUrl'] as String,
  userId: json['userId'] as String,
  token: json['token'] as String,
);

Map<String, dynamic> _$OrgProfileToJson(_OrgProfile instance) =>
    <String, dynamic>{
      'orgId': instance.orgId,
      'orgName': instance.orgName,
      'serverUrl': instance.serverUrl,
      'userId': instance.userId,
      'token': instance.token,
    };
