// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fcmRepository)
final fcmRepositoryProvider = FcmRepositoryProvider._();

final class FcmRepositoryProvider
    extends $FunctionalProvider<FcmRepository, FcmRepository, FcmRepository>
    with $Provider<FcmRepository> {
  FcmRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fcmRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fcmRepositoryHash();

  @$internal
  @override
  $ProviderElement<FcmRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FcmRepository create(Ref ref) {
    return fcmRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FcmRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FcmRepository>(value),
    );
  }
}

String _$fcmRepositoryHash() => r'93882a9b372b26cd9669a27e9c72fa396194931e';
