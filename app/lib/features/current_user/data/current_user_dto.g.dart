// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CurrentUserProfileDto _$CurrentUserProfileDtoFromJson(
  Map<String, dynamic> json,
) => _CurrentUserProfileDto(
  id: json['id'] as String,
  displayName: json['display_name'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$CurrentUserProfileDtoToJson(
  _CurrentUserProfileDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'display_name': instance.displayName,
  'created_at': instance.createdAt.toIso8601String(),
};

_CurrentUserDeviceDto _$CurrentUserDeviceDtoFromJson(
  Map<String, dynamic> json,
) => _CurrentUserDeviceDto(
  id: json['id'] as String,
  deviceName: json['device_name'] as String,
  locale: json['locale'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$CurrentUserDeviceDtoToJson(
  _CurrentUserDeviceDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'device_name': instance.deviceName,
  'locale': instance.locale,
  'created_at': instance.createdAt.toIso8601String(),
};

_CurrentUserCredentialDto _$CurrentUserCredentialDtoFromJson(
  Map<String, dynamic> json,
) => _CurrentUserCredentialDto(
  id: (json['id'] as num).toInt(),
  nickname: json['nickname'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  lastUsedAt: json['last_used_at'] == null
      ? null
      : DateTime.parse(json['last_used_at'] as String),
);

Map<String, dynamic> _$CurrentUserCredentialDtoToJson(
  _CurrentUserCredentialDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'nickname': instance.nickname,
  'created_at': instance.createdAt.toIso8601String(),
  'last_used_at': instance.lastUsedAt?.toIso8601String(),
};

_CurrentUserDto _$CurrentUserDtoFromJson(
  Map<String, dynamic> json,
) => _CurrentUserDto(
  user: CurrentUserProfileDto.fromJson(json['user'] as Map<String, dynamic>),
  orgName: json['org_name'] as String,
  devices:
      (json['devices'] as List<dynamic>?)
          ?.map((e) => CurrentUserDeviceDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CurrentUserDeviceDto>[],
  credentials:
      (json['credentials'] as List<dynamic>?)
          ?.map(
            (e) => CurrentUserCredentialDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <CurrentUserCredentialDto>[],
);

Map<String, dynamic> _$CurrentUserDtoToJson(_CurrentUserDto instance) =>
    <String, dynamic>{
      'user': instance.user,
      'org_name': instance.orgName,
      'devices': instance.devices,
      'credentials': instance.credentials,
    };
