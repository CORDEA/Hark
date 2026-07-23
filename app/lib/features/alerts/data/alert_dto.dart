import 'package:freezed_annotation/freezed_annotation.dart';

part 'alert_dto.freezed.dart';
part 'alert_dto.g.dart';

// Alert types as sent by the backend (see backend/models/models.go).
class AlertType {
  static const critical = 'critical';
  static const warning = 'warning';
}

class RecipientResponse {
  static const pending = 'pending';
  static const acknowledged = 'acknowledged';
  static const declined = 'declined';
}

@freezed
abstract class AlertSummaryDto with _$AlertSummaryDto {
  const factory AlertSummaryDto({
    required String id,
    required String type,
    required String status,
    @JsonKey(name: 'is_broadcast') required bool isBroadcast,
    @JsonKey(name: 'triggered_at') required DateTime triggeredAt,
    @JsonKey(name: 'resolved_at') DateTime? resolvedAt,
    @JsonKey(name: 'responder_id') String? responderId,
    @JsonKey(name: 'responder_name') String? responderName,
    @JsonKey(name: 'target_names')
    @Default(<String>[])
    List<String> targetNames,
    @JsonKey(name: 'ack_count') @Default(0) int ackCount,
    @JsonKey(name: 'pending_count') @Default(0) int pendingCount,
    @JsonKey(name: 'decline_count') @Default(0) int declineCount,
    @JsonKey(name: 'is_recipient') @Default(false) bool isRecipient,
    @JsonKey(name: 'my_response_status') String? myResponseStatus,
    @JsonKey(name: 'my_responded_at') DateTime? myRespondedAt,
  }) = _AlertSummaryDto;

  factory AlertSummaryDto.fromJson(Map<String, dynamic> json) =>
      _$AlertSummaryDtoFromJson(json);
}

@freezed
abstract class AlertRecipientDto with _$AlertRecipientDto {
  const factory AlertRecipientDto({
    @JsonKey(name: 'user_id') required String userId,
    required String name,
    @JsonKey(name: 'response_status') required String responseStatus,
    @JsonKey(name: 'responded_at') DateTime? respondedAt,
  }) = _AlertRecipientDto;

  factory AlertRecipientDto.fromJson(Map<String, dynamic> json) =>
      _$AlertRecipientDtoFromJson(json);
}

@freezed
abstract class AlertDetailDto with _$AlertDetailDto {
  const factory AlertDetailDto({
    required String id,
    required String type,
    required String status,
    @JsonKey(name: 'is_broadcast') required bool isBroadcast,
    @JsonKey(name: 'triggered_at') required DateTime triggeredAt,
    @JsonKey(name: 'resolved_at') DateTime? resolvedAt,
    @JsonKey(name: 'responder_id') String? responderId,
    @JsonKey(name: 'responder_name') String? responderName,
    @JsonKey(name: 'target_names')
    @Default(<String>[])
    List<String> targetNames,
    @JsonKey(name: 'ack_count') @Default(0) int ackCount,
    @JsonKey(name: 'pending_count') @Default(0) int pendingCount,
    @JsonKey(name: 'decline_count') @Default(0) int declineCount,
    @JsonKey(name: 'is_recipient') @Default(false) bool isRecipient,
    @JsonKey(name: 'my_response_status') String? myResponseStatus,
    @JsonKey(name: 'my_responded_at') DateTime? myRespondedAt,
    @Default(<AlertRecipientDto>[]) List<AlertRecipientDto> recipients,
  }) = _AlertDetailDto;

  factory AlertDetailDto.fromJson(Map<String, dynamic> json) =>
      _$AlertDetailDtoFromJson(json);
}

@freezed
abstract class RespondAlertRequestDto with _$RespondAlertRequestDto {
  const factory RespondAlertRequestDto({required String action}) =
      _RespondAlertRequestDto;

  factory RespondAlertRequestDto.fromJson(Map<String, dynamic> json) =>
      _$RespondAlertRequestDtoFromJson(json);
}

@freezed
abstract class RespondAlertResponseDto with _$RespondAlertResponseDto {
  const factory RespondAlertResponseDto({
    @JsonKey(name: 'alert_id') required String alertId,
    required String status,
    @JsonKey(name: 'first_response') required bool firstResponse,
    @JsonKey(name: 'responder_id') String? responderId,
  }) = _RespondAlertResponseDto;

  factory RespondAlertResponseDto.fromJson(Map<String, dynamic> json) =>
      _$RespondAlertResponseDtoFromJson(json);
}
