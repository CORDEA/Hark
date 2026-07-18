// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_organizations_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getOrganizationsUseCase)
final getOrganizationsUseCaseProvider = GetOrganizationsUseCaseProvider._();

final class GetOrganizationsUseCaseProvider
    extends
        $FunctionalProvider<
          GetOrganizationsUseCase,
          GetOrganizationsUseCase,
          GetOrganizationsUseCase
        >
    with $Provider<GetOrganizationsUseCase> {
  GetOrganizationsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getOrganizationsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getOrganizationsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetOrganizationsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetOrganizationsUseCase create(Ref ref) {
    return getOrganizationsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetOrganizationsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetOrganizationsUseCase>(value),
    );
  }
}

String _$getOrganizationsUseCaseHash() =>
    r'5956371cbe91243f910cc98fb84f6dfedec76896';
