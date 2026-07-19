// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_alert_detail_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getAlertDetailUseCase)
final getAlertDetailUseCaseProvider = GetAlertDetailUseCaseProvider._();

final class GetAlertDetailUseCaseProvider
    extends
        $FunctionalProvider<
          GetAlertDetailUseCase,
          GetAlertDetailUseCase,
          GetAlertDetailUseCase
        >
    with $Provider<GetAlertDetailUseCase> {
  GetAlertDetailUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getAlertDetailUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getAlertDetailUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetAlertDetailUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetAlertDetailUseCase create(Ref ref) {
    return getAlertDetailUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetAlertDetailUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetAlertDetailUseCase>(value),
    );
  }
}

String _$getAlertDetailUseCaseHash() =>
    r'fdb9d5cb012af2467750e6889cc232013b203996';
