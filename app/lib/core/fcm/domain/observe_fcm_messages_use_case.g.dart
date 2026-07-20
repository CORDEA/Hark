// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observe_fcm_messages_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(observeFcmMessagesUseCase)
final observeFcmMessagesUseCaseProvider = ObserveFcmMessagesUseCaseProvider._();

final class ObserveFcmMessagesUseCaseProvider
    extends
        $FunctionalProvider<
          ObserveFcmMessagesUseCase,
          ObserveFcmMessagesUseCase,
          ObserveFcmMessagesUseCase
        >
    with $Provider<ObserveFcmMessagesUseCase> {
  ObserveFcmMessagesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'observeFcmMessagesUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$observeFcmMessagesUseCaseHash();

  @$internal
  @override
  $ProviderElement<ObserveFcmMessagesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ObserveFcmMessagesUseCase create(Ref ref) {
    return observeFcmMessagesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ObserveFcmMessagesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ObserveFcmMessagesUseCase>(value),
    );
  }
}

String _$observeFcmMessagesUseCaseHash() =>
    r'45a97c068979295baccdbe3e5c10e3c910446337';
