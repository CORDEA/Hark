// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initialize_firebase_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(initializeFirebaseUseCase)
final initializeFirebaseUseCaseProvider = InitializeFirebaseUseCaseProvider._();

final class InitializeFirebaseUseCaseProvider
    extends
        $FunctionalProvider<
          InitializeFirebaseUseCase,
          InitializeFirebaseUseCase,
          InitializeFirebaseUseCase
        >
    with $Provider<InitializeFirebaseUseCase> {
  InitializeFirebaseUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'initializeFirebaseUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$initializeFirebaseUseCaseHash();

  @$internal
  @override
  $ProviderElement<InitializeFirebaseUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InitializeFirebaseUseCase create(Ref ref) {
    return initializeFirebaseUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InitializeFirebaseUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InitializeFirebaseUseCase>(value),
    );
  }
}

String _$initializeFirebaseUseCaseHash() =>
    r'0b27bed62727e90a4fb35f537381bae740dd7c07';
