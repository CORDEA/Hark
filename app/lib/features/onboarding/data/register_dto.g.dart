// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterRequestDto _$RegisterRequestDtoFromJson(Map<String, dynamic> json) =>
    _RegisterRequestDto(
      invitationCode: json['invitation_code'] as String,
      fcmToken: json['fcm_token'] as String,
      deviceName: json['device_name'] as String,
    );

Map<String, dynamic> _$RegisterRequestDtoToJson(_RegisterRequestDto instance) =>
    <String, dynamic>{
      'invitation_code': instance.invitationCode,
      'fcm_token': instance.fcmToken,
      'device_name': instance.deviceName,
    };

_RegisterResponseDto _$RegisterResponseDtoFromJson(Map<String, dynamic> json) =>
    _RegisterResponseDto(
      userId: json['user_id'] as String,
      deviceId: json['device_id'] as String,
      orgName: json['org_name'] as String,
      orgId: json['org_id'] as String,
    );

Map<String, dynamic> _$RegisterResponseDtoToJson(
  _RegisterResponseDto instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'device_id': instance.deviceId,
  'org_name': instance.orgName,
  'org_id': instance.orgId,
};
