// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(orgRepository)
final orgRepositoryProvider = OrgRepositoryProvider._();

final class OrgRepositoryProvider
    extends $FunctionalProvider<OrgRepository, OrgRepository, OrgRepository>
    with $Provider<OrgRepository> {
  OrgRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orgRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orgRepositoryHash();

  @$internal
  @override
  $ProviderElement<OrgRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  OrgRepository create(Ref ref) {
    return orgRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrgRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrgRepository>(value),
    );
  }
}

String _$orgRepositoryHash() => r'c1f339b3887c85402f6d720d2fc659dfab287b4d';
