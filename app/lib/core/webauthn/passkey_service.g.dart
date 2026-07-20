// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(passkeyService)
final passkeyServiceProvider = PasskeyServiceProvider._();

final class PasskeyServiceProvider
    extends $FunctionalProvider<PasskeyService, PasskeyService, PasskeyService>
    with $Provider<PasskeyService> {
  PasskeyServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passkeyServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passkeyServiceHash();

  @$internal
  @override
  $ProviderElement<PasskeyService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PasskeyService create(Ref ref) {
    return passkeyService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PasskeyService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PasskeyService>(value),
    );
  }
}

String _$passkeyServiceHash() => r'eb2a83f5436d6c5ff98220f52f9a330b8d4773aa';
