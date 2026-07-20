// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webauthn_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterFinishResponseDto _$RegisterFinishResponseDtoFromJson(
  Map<String, dynamic> json,
) => _RegisterFinishResponseDto(
  userId: json['user_id'] as String,
  authToken: json['auth_token'] as String,
  tokenExpiresAt: DateTime.parse(json['token_expires_at'] as String),
);

Map<String, dynamic> _$RegisterFinishResponseDtoToJson(
  _RegisterFinishResponseDto instance,
) => <String, dynamic>{
  'user_id': instance.userId,
  'auth_token': instance.authToken,
  'token_expires_at': instance.tokenExpiresAt.toIso8601String(),
};

_RegisterDeviceResponseDto _$RegisterDeviceResponseDtoFromJson(
  Map<String, dynamic> json,
) => _RegisterDeviceResponseDto(deviceId: json['device_id'] as String);

Map<String, dynamic> _$RegisterDeviceResponseDtoToJson(
  _RegisterDeviceResponseDto instance,
) => <String, dynamic>{'device_id': instance.deviceId};
