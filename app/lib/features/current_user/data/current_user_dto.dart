import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_user_dto.freezed.dart';
part 'current_user_dto.g.dart';

@freezed
abstract class CurrentUserProfileDto with _$CurrentUserProfileDto {
  const factory CurrentUserProfileDto({
    required String id,
    @JsonKey(name: 'display_name') required String displayName,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _CurrentUserProfileDto;

  factory CurrentUserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserProfileDtoFromJson(json);
}

@freezed
abstract class CurrentUserDeviceDto with _$CurrentUserDeviceDto {
  const factory CurrentUserDeviceDto({
    required String id,
    @JsonKey(name: 'device_name') required String deviceName,
    required String locale,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _CurrentUserDeviceDto;

  factory CurrentUserDeviceDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserDeviceDtoFromJson(json);
}

@freezed
abstract class CurrentUserCredentialDto with _$CurrentUserCredentialDto {
  const factory CurrentUserCredentialDto({
    required int id,
    required String nickname,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'last_used_at') DateTime? lastUsedAt,
  }) = _CurrentUserCredentialDto;

  factory CurrentUserCredentialDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserCredentialDtoFromJson(json);
}

@freezed
abstract class CurrentUserDto with _$CurrentUserDto {
  const factory CurrentUserDto({
    required CurrentUserProfileDto user,
    @JsonKey(name: 'org_name') required String orgName,
    @Default(<CurrentUserDeviceDto>[]) List<CurrentUserDeviceDto> devices,
    @Default(<CurrentUserCredentialDto>[])
    List<CurrentUserCredentialDto> credentials,
  }) = _CurrentUserDto;

  factory CurrentUserDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserDtoFromJson(json);
}
