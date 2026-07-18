import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fcm_token_provider.g.dart';

/// F2 stub: returns a synthetic token so the register flow can be exercised
/// end-to-end without Firebase configured. F3 replaces the implementation with
/// FirebaseMessaging.instance.getToken().
@Riverpod(keepAlive: true)
Future<String> fcmToken(Ref ref) async {
  // Deterministic across launches on the same install so the backend treats
  // repeat registers as idempotent per token.
  return 'placeholder-fcm-token';
}
