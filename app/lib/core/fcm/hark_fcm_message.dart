import 'package:freezed_annotation/freezed_annotation.dart';

part 'hark_fcm_message.freezed.dart';

/// Sealed union over the three payload shapes the backend produces. Every
/// message carries a `kind` field on the data map — see backend/fcm.go.
@freezed
sealed class HarkFcmMessage with _$HarkFcmMessage {
  const factory HarkFcmMessage.alert({
    required String alertId,
    required String orgId,
    required String type,
  }) = HarkAlert;

  const factory HarkFcmMessage.resolve({required String alertId}) = HarkResolve;

  const factory HarkFcmMessage.test() = HarkTest;

  /// Parses the FCM `data` map. Returns null when the payload is unknown so
  /// callers can log-and-drop instead of crashing on an unexpected schema.
  static HarkFcmMessage? tryParse(Map<String, dynamic> data) {
    final kind = data['kind'];
    switch (kind) {
      case 'alert':
        final id = data['alert_id'];
        final org = data['org_id'];
        final type = data['type'];
        if (id is String && org is String && type is String) {
          return HarkFcmMessage.alert(alertId: id, orgId: org, type: type);
        }
        return null;
      case 'resolve':
        final id = data['alert_id'];
        if (id is String) return HarkFcmMessage.resolve(alertId: id);
        return null;
      case 'test':
        return const HarkFcmMessage.test();
      default:
        return null;
    }
  }
}
