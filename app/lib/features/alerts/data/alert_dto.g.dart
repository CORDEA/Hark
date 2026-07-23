// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AlertSummaryDto _$AlertSummaryDtoFromJson(Map<String, dynamic> json) =>
    _AlertSummaryDto(
      id: json['id'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      isBroadcast: json['is_broadcast'] as bool,
      triggeredAt: DateTime.parse(json['triggered_at'] as String),
      resolvedAt: json['resolved_at'] == null
          ? null
          : DateTime.parse(json['resolved_at'] as String),
      responderId: json['responder_id'] as String?,
      responderName: json['responder_name'] as String?,
      targetNames:
          (json['target_names'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      ackCount: (json['ack_count'] as num?)?.toInt() ?? 0,
      pendingCount: (json['pending_count'] as num?)?.toInt() ?? 0,
      declineCount: (json['decline_count'] as num?)?.toInt() ?? 0,
      isRecipient: json['is_recipient'] as bool? ?? false,
      myResponseStatus: json['my_response_status'] as String?,
      myRespondedAt: json['my_responded_at'] == null
          ? null
          : DateTime.parse(json['my_responded_at'] as String),
    );

Map<String, dynamic> _$AlertSummaryDtoToJson(_AlertSummaryDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'status': instance.status,
      'is_broadcast': instance.isBroadcast,
      'triggered_at': instance.triggeredAt.toIso8601String(),
      'resolved_at': instance.resolvedAt?.toIso8601String(),
      'responder_id': instance.responderId,
      'responder_name': instance.responderName,
      'target_names': instance.targetNames,
      'ack_count': instance.ackCount,
      'pending_count': instance.pendingCount,
      'decline_count': instance.declineCount,
      'is_recipient': instance.isRecipient,
      'my_response_status': instance.myResponseStatus,
      'my_responded_at': instance.myRespondedAt?.toIso8601String(),
    };

_AlertRecipientDto _$AlertRecipientDtoFromJson(Map<String, dynamic> json) =>
    _AlertRecipientDto(
      userId: json['user_id'] as String,
      name: json['name'] as String,
      responseStatus: json['response_status'] as String,
      respondedAt: json['responded_at'] == null
          ? null
          : DateTime.parse(json['responded_at'] as String),
    );

Map<String, dynamic> _$AlertRecipientDtoToJson(_AlertRecipientDto instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'name': instance.name,
      'response_status': instance.responseStatus,
      'responded_at': instance.respondedAt?.toIso8601String(),
    };

_AlertDetailDto _$AlertDetailDtoFromJson(Map<String, dynamic> json) =>
    _AlertDetailDto(
      id: json['id'] as String,
      type: json['type'] as String,
      status: json['status'] as String,
      isBroadcast: json['is_broadcast'] as bool,
      triggeredAt: DateTime.parse(json['triggered_at'] as String),
      resolvedAt: json['resolved_at'] == null
          ? null
          : DateTime.parse(json['resolved_at'] as String),
      responderId: json['responder_id'] as String?,
      responderName: json['responder_name'] as String?,
      targetNames:
          (json['target_names'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      ackCount: (json['ack_count'] as num?)?.toInt() ?? 0,
      pendingCount: (json['pending_count'] as num?)?.toInt() ?? 0,
      declineCount: (json['decline_count'] as num?)?.toInt() ?? 0,
      isRecipient: json['is_recipient'] as bool? ?? false,
      myResponseStatus: json['my_response_status'] as String?,
      myRespondedAt: json['my_responded_at'] == null
          ? null
          : DateTime.parse(json['my_responded_at'] as String),
      recipients:
          (json['recipients'] as List<dynamic>?)
              ?.map(
                (e) => AlertRecipientDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <AlertRecipientDto>[],
    );

Map<String, dynamic> _$AlertDetailDtoToJson(_AlertDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'status': instance.status,
      'is_broadcast': instance.isBroadcast,
      'triggered_at': instance.triggeredAt.toIso8601String(),
      'resolved_at': instance.resolvedAt?.toIso8601String(),
      'responder_id': instance.responderId,
      'responder_name': instance.responderName,
      'target_names': instance.targetNames,
      'ack_count': instance.ackCount,
      'pending_count': instance.pendingCount,
      'decline_count': instance.declineCount,
      'is_recipient': instance.isRecipient,
      'my_response_status': instance.myResponseStatus,
      'my_responded_at': instance.myRespondedAt?.toIso8601String(),
      'recipients': instance.recipients,
    };

_RespondAlertRequestDto _$RespondAlertRequestDtoFromJson(
  Map<String, dynamic> json,
) => _RespondAlertRequestDto(action: json['action'] as String);

Map<String, dynamic> _$RespondAlertRequestDtoToJson(
  _RespondAlertRequestDto instance,
) => <String, dynamic>{'action': instance.action};

_RespondAlertResponseDto _$RespondAlertResponseDtoFromJson(
  Map<String, dynamic> json,
) => _RespondAlertResponseDto(
  alertId: json['alert_id'] as String,
  status: json['status'] as String,
  firstResponse: json['first_response'] as bool,
  responderId: json['responder_id'] as String?,
);

Map<String, dynamic> _$RespondAlertResponseDtoToJson(
  _RespondAlertResponseDto instance,
) => <String, dynamic>{
  'alert_id': instance.alertId,
  'status': instance.status,
  'first_response': instance.firstResponse,
  'responder_id': instance.responderId,
};
