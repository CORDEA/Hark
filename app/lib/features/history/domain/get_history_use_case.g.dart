// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_history_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getHistoryUseCase)
final getHistoryUseCaseProvider = GetHistoryUseCaseProvider._();

final class GetHistoryUseCaseProvider
    extends
        $FunctionalProvider<
          GetHistoryUseCase,
          GetHistoryUseCase,
          GetHistoryUseCase
        >
    with $Provider<GetHistoryUseCase> {
  GetHistoryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getHistoryUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getHistoryUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetHistoryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetHistoryUseCase create(Ref ref) {
    return getHistoryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetHistoryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetHistoryUseCase>(value),
    );
  }
}

String _$getHistoryUseCaseHash() => r'adb7b1d082f0e96e9bac58f1b5ef700a4c43b483';
