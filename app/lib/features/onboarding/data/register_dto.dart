import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_dto.freezed.dart';
part 'register_dto.g.dart';

@freezed
abstract class RegisterRequestDto with _$RegisterRequestDto {
  const factory RegisterRequestDto({
    @JsonKey(name: 'invitation_code') required String invitationCode,
    @JsonKey(name: 'fcm_token') required String fcmToken,
    @JsonKey(name: 'device_name') required String deviceName,
  }) = _RegisterRequestDto;

  factory RegisterRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestDtoFromJson(json);
}

@freezed
abstract class RegisterResponseDto with _$RegisterResponseDto {
  const factory RegisterResponseDto({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'device_id') required String deviceId,
    @JsonKey(name: 'org_name') required String orgName,
    @JsonKey(name: 'org_id') required String orgId,
  }) = _RegisterResponseDto;

  factory RegisterResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseDtoFromJson(json);
}
