import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'fcm_service.dart';

part 'fcm_token_provider.g.dart';

/// The current FCM registration token, or a synthetic placeholder when
/// Firebase isn't configured locally. The placeholder lets developers exercise
/// the register flow against a real backend without stamping a Firebase
/// project first.
@Riverpod(keepAlive: true)
Future<String> fcmToken(Ref ref) async {
  final service = ref.watch(fcmServiceProvider);
  final real = await service.currentToken();
  return real ?? 'placeholder-fcm-token';
}
