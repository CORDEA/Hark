// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_device_via_synced_passkey_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(addDeviceViaSyncedPasskeyUseCase)
final addDeviceViaSyncedPasskeyUseCaseProvider =
    AddDeviceViaSyncedPasskeyUseCaseProvider._();

final class AddDeviceViaSyncedPasskeyUseCaseProvider
    extends
        $FunctionalProvider<
          AddDeviceViaSyncedPasskeyUseCase,
          AddDeviceViaSyncedPasskeyUseCase,
          AddDeviceViaSyncedPasskeyUseCase
        >
    with $Provider<AddDeviceViaSyncedPasskeyUseCase> {
  AddDeviceViaSyncedPasskeyUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addDeviceViaSyncedPasskeyUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addDeviceViaSyncedPasskeyUseCaseHash();

  @$internal
  @override
  $ProviderElement<AddDeviceViaSyncedPasskeyUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AddDeviceViaSyncedPasskeyUseCase create(Ref ref) {
    return addDeviceViaSyncedPasskeyUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddDeviceViaSyncedPasskeyUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddDeviceViaSyncedPasskeyUseCase>(
        value,
      ),
    );
  }
}

String _$addDeviceViaSyncedPasskeyUseCaseHash() =>
    r'4393eede26a1023c095e9a83ec401b7a0ed50436';
