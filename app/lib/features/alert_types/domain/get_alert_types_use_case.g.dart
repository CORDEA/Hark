// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_alert_types_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getAlertTypesUseCase)
final getAlertTypesUseCaseProvider = GetAlertTypesUseCaseProvider._();

final class GetAlertTypesUseCaseProvider
    extends
        $FunctionalProvider<
          GetAlertTypesUseCase,
          GetAlertTypesUseCase,
          GetAlertTypesUseCase
        >
    with $Provider<GetAlertTypesUseCase> {
  GetAlertTypesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAlertTypesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAlertTypesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetAlertTypesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetAlertTypesUseCase create(Ref ref) {
    return getAlertTypesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetAlertTypesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetAlertTypesUseCase>(value),
    );
  }
}

String _$getAlertTypesUseCaseHash() =>
    r'c9cf20f8d2ba2f93a3177243d3522a76e6666848';
