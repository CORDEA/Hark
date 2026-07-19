// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The current FCM registration token, or a synthetic placeholder when
/// Firebase isn't configured locally. The placeholder lets developers exercise
/// the register flow against a real backend without stamping a Firebase
/// project first.

@ProviderFor(fcmToken)
final fcmTokenProvider = FcmTokenProvider._();

/// The current FCM registration token, or a synthetic placeholder when
/// Firebase isn't configured locally. The placeholder lets developers exercise
/// the register flow against a real backend without stamping a Firebase
/// project first.

final class FcmTokenProvider
    extends $FunctionalProvider<AsyncValue<String>, String, FutureOr<String>>
    with $FutureModifier<String>, $FutureProvider<String> {
  /// The current FCM registration token, or a synthetic placeholder when
  /// Firebase isn't configured locally. The placeholder lets developers exercise
  /// the register flow against a real backend without stamping a Firebase
  /// project first.
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

String _$fcmTokenHash() => r'228911f0d006057db792ba7fe04e055f2c0ac6e2';
