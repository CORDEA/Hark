import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'domain/get_fcm_token_use_case.dart';

part 'fcm_token_provider.g.dart';

/// The current FCM registration token, or a synthetic placeholder when
/// Firebase isn't configured locally. The placeholder lets developers exercise
/// the register flow against a real backend without stamping a Firebase
/// project first.
@Riverpod(keepAlive: true)
Future<String> fcmToken(Ref ref) async {
  final token = await ref.watch(getFcmTokenUseCaseProvider).execute();
  return token ?? 'placeholder-fcm-token';
}
