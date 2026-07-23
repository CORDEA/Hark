// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_notification_channels_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(createNotificationChannelsUseCase)
final createNotificationChannelsUseCaseProvider =
    CreateNotificationChannelsUseCaseProvider._();

final class CreateNotificationChannelsUseCaseProvider
    extends
        $FunctionalProvider<
          CreateNotificationChannelsUseCase,
          CreateNotificationChannelsUseCase,
          CreateNotificationChannelsUseCase
        >
    with $Provider<CreateNotificationChannelsUseCase> {
  CreateNotificationChannelsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'createNotificationChannelsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$createNotificationChannelsUseCaseHash();

  @$internal
  @override
  $ProviderElement<CreateNotificationChannelsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CreateNotificationChannelsUseCase create(Ref ref) {
    return createNotificationChannelsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CreateNotificationChannelsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CreateNotificationChannelsUseCase>(
        value,
      ),
    );
  }
}

String _$createNotificationChannelsUseCaseHash() =>
    r'bcf784d296436b47eb0ff08f46808e70c1e80fb6';
