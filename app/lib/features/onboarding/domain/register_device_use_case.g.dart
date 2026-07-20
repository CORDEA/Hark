// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(registerDeviceUseCase)
final registerDeviceUseCaseProvider = RegisterDeviceUseCaseProvider._();

final class RegisterDeviceUseCaseProvider
    extends
        $FunctionalProvider<
          RegisterDeviceUseCase,
          RegisterDeviceUseCase,
          RegisterDeviceUseCase
        >
    with $Provider<RegisterDeviceUseCase> {
  RegisterDeviceUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerDeviceUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerDeviceUseCaseHash();

  @$internal
  @override
  $ProviderElement<RegisterDeviceUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RegisterDeviceUseCase create(Ref ref) {
    return registerDeviceUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterDeviceUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterDeviceUseCase>(value),
    );
  }
}

String _$registerDeviceUseCaseHash() =>
    r'8c43c8cbcee0ba7947b77959c6d28e76d540f779';
