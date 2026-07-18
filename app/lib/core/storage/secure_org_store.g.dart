// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secure_org_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(secureStorage)
final secureStorageProvider = SecureStorageProvider._();

final class SecureStorageProvider
    extends
        $FunctionalProvider<
          FlutterSecureStorage,
          FlutterSecureStorage,
          FlutterSecureStorage
        >
    with $Provider<FlutterSecureStorage> {
  SecureStorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureStorageProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureStorageHash();

  @$internal
  @override
  $ProviderElement<FlutterSecureStorage> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FlutterSecureStorage create(Ref ref) {
    return secureStorage(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterSecureStorage value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterSecureStorage>(value),
    );
  }
}

String _$secureStorageHash() => r'3f86743cbe4607b66acc21d23adde6a8e6aef97f';

/// Persists the list of connected organizations as a JSON array in the
/// platform's secure storage. The full list is rewritten on every mutation —
/// this is fine because the list is bounded (a user has a handful of orgs).

@ProviderFor(secureOrgStore)
final secureOrgStoreProvider = SecureOrgStoreProvider._();

/// Persists the list of connected organizations as a JSON array in the
/// platform's secure storage. The full list is rewritten on every mutation —
/// this is fine because the list is bounded (a user has a handful of orgs).

final class SecureOrgStoreProvider
    extends $FunctionalProvider<SecureOrgStore, SecureOrgStore, SecureOrgStore>
    with $Provider<SecureOrgStore> {
  /// Persists the list of connected organizations as a JSON array in the
  /// platform's secure storage. The full list is rewritten on every mutation —
  /// this is fine because the list is bounded (a user has a handful of orgs).
  SecureOrgStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'secureOrgStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$secureOrgStoreHash();

  @$internal
  @override
  $ProviderElement<SecureOrgStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SecureOrgStore create(Ref ref) {
    return secureOrgStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SecureOrgStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SecureOrgStore>(value),
    );
  }
}

String _$secureOrgStoreHash() => r'a7bdccee838319d4aeffeec8340f43f05579589f';
