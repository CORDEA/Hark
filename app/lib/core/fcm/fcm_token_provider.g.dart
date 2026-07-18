// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// F2 stub: returns a synthetic token so the register flow can be exercised
/// end-to-end without Firebase configured. F3 replaces the implementation with
/// FirebaseMessaging.instance.getToken().

@ProviderFor(fcmToken)
final fcmTokenProvider = FcmTokenProvider._();

/// F2 stub: returns a synthetic token so the register flow can be exercised
/// end-to-end without Firebase configured. F3 replaces the implementation with
/// FirebaseMessaging.instance.getToken().

final class FcmTokenProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  /// F2 stub: returns a synthetic token so the register flow can be exercised
  /// end-to-end without Firebase configured. F3 replaces the implementation with
  /// FirebaseMessaging.instance.getToken().
  FcmTokenProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fcmTokenProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fcmTokenHash();

  @$internal
  @override
  $FutureProviderElement<String> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<String> create(Ref ref) {
    return fcmToken(ref);
  }
}

String _$fcmTokenHash() => r'685a8262d9398e76d44659a15e8e9c674b3e7f3b';
