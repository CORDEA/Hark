import 'package:freezed_annotation/freezed_annotation.dart';

part 'webauthn_dto.freezed.dart';
part 'webauthn_dto.g.dart';

@freezed
abstract class RegisterFinishResponseDto with _$RegisterFinishResponseDto {
  const factory RegisterFinishResponseDto({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'auth_token') required String authToken,
    @JsonKey(name: 'token_expires_at') required DateTime tokenExpiresAt,
  }) = _RegisterFinishResponseDto;

  factory RegisterFinishResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterFinishResponseDtoFromJson(json);
}

@freezed
abstract class RegisterDeviceResponseDto with _$RegisterDeviceResponseDto {
  const factory RegisterDeviceResponseDto({
    @JsonKey(name: 'device_id') required String deviceId,
  }) = _RegisterDeviceResponseDto;

  factory RegisterDeviceResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceResponseDtoFromJson(json);
}

@freezed
abstract class AssertionFinishResponseDto with _$AssertionFinishResponseDto {
  const factory AssertionFinishResponseDto({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'auth_token') required String authToken,
    @JsonKey(name: 'token_expires_at') required DateTime tokenExpiresAt,
  }) = _AssertionFinishResponseDto;

  factory AssertionFinishResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AssertionFinishResponseDtoFromJson(json);
}
