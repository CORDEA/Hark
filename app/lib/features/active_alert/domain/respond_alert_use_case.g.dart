// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'respond_alert_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(respondAlertUseCase)
final respondAlertUseCaseProvider = RespondAlertUseCaseProvider._();

final class RespondAlertUseCaseProvider
    extends
        $FunctionalProvider<
          RespondAlertUseCase,
          RespondAlertUseCase,
          RespondAlertUseCase
        >
    with $Provider<RespondAlertUseCase> {
  RespondAlertUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'respondAlertUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$respondAlertUseCaseHash();

  @$internal
  @override
  $ProviderElement<RespondAlertUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RespondAlertUseCase create(Ref ref) {
    return respondAlertUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RespondAlertUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RespondAlertUseCase>(value),
    );
  }
}

String _$respondAlertUseCaseHash() =>
    r'8e37282dd5bf43790e7bfa1c33227fc3a297d1ed';
