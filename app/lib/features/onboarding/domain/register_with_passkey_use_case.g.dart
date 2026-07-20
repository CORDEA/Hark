// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_with_passkey_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(registerWithPasskeyUseCase)
final registerWithPasskeyUseCaseProvider =
    RegisterWithPasskeyUseCaseProvider._();

final class RegisterWithPasskeyUseCaseProvider
    extends
        $FunctionalProvider<
          RegisterWithPasskeyUseCase,
          RegisterWithPasskeyUseCase,
          RegisterWithPasskeyUseCase
        >
    with $Provider<RegisterWithPasskeyUseCase> {
  RegisterWithPasskeyUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'registerWithPasskeyUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$registerWithPasskeyUseCaseHash();

  @$internal
  @override
  $ProviderElement<RegisterWithPasskeyUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RegisterWithPasskeyUseCase create(Ref ref) {
    return registerWithPasskeyUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RegisterWithPasskeyUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RegisterWithPasskeyUseCase>(value),
    );
  }
}

String _$registerWithPasskeyUseCaseHash() =>
    r'39fe9800e2c6950a4e8a06820e86ba423045ce92';
