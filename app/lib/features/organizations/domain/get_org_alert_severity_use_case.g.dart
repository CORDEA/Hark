// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_org_alert_severity_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getOrgAlertSeverityUseCase)
final getOrgAlertSeverityUseCaseProvider =
    GetOrgAlertSeverityUseCaseProvider._();

final class GetOrgAlertSeverityUseCaseProvider
    extends
        $FunctionalProvider<
          GetOrgAlertSeverityUseCase,
          GetOrgAlertSeverityUseCase,
          GetOrgAlertSeverityUseCase
        >
    with $Provider<GetOrgAlertSeverityUseCase> {
  GetOrgAlertSeverityUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getOrgAlertSeverityUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getOrgAlertSeverityUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetOrgAlertSeverityUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetOrgAlertSeverityUseCase create(Ref ref) {
    return getOrgAlertSeverityUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetOrgAlertSeverityUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetOrgAlertSeverityUseCase>(value),
    );
  }
}

String _$getOrgAlertSeverityUseCaseHash() =>
    r'5bb23e1076cab83c5c500c2aa0e60d1a182d2153';
