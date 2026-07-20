// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_notification_permission_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(requestNotificationPermissionUseCase)
final requestNotificationPermissionUseCaseProvider =
    RequestNotificationPermissionUseCaseProvider._();

final class RequestNotificationPermissionUseCaseProvider
    extends
        $FunctionalProvider<
          RequestNotificationPermissionUseCase,
          RequestNotificationPermissionUseCase,
          RequestNotificationPermissionUseCase
        >
    with $Provider<RequestNotificationPermissionUseCase> {
  RequestNotificationPermissionUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'requestNotificationPermissionUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$requestNotificationPermissionUseCaseHash();

  @$internal
  @override
  $ProviderElement<RequestNotificationPermissionUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RequestNotificationPermissionUseCase create(Ref ref) {
    return requestNotificationPermissionUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RequestNotificationPermissionUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<RequestNotificationPermissionUseCase>(value),
    );
  }
}

String _$requestNotificationPermissionUseCaseHash() =>
    r'caab6af3863a1a6ca33a6aeb1cda2edf71c81858';
