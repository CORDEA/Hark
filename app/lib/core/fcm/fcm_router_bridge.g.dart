// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_router_bridge.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Listens on [FcmService.messages] and routes to /alert/:id whenever an
/// alert lands. Resolve/test payloads are broadcast on [resolveEvents] /
/// [testEvents] for the active-alert screen and any future subscribers.

@ProviderFor(fcmRouterBridge)
final fcmRouterBridgeProvider = FcmRouterBridgeProvider._();

/// Listens on [FcmService.messages] and routes to /alert/:id whenever an
/// alert lands. Resolve/test payloads are broadcast on [resolveEvents] /
/// [testEvents] for the active-alert screen and any future subscribers.

final class FcmRouterBridgeProvider
    extends
        $FunctionalProvider<FcmRouterBridge, FcmRouterBridge, FcmRouterBridge>
    with $Provider<FcmRouterBridge> {
  /// Listens on [FcmService.messages] and routes to /alert/:id whenever an
  /// alert lands. Resolve/test payloads are broadcast on [resolveEvents] /
  /// [testEvents] for the active-alert screen and any future subscribers.
  FcmRouterBridgeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fcmRouterBridgeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fcmRouterBridgeHash();

  @$internal
  @override
  $ProviderElement<FcmRouterBridge> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  FcmRouterBridge create(Ref ref) {
    return fcmRouterBridge(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FcmRouterBridge value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FcmRouterBridge>(value),
    );
  }
}

String _$fcmRouterBridgeHash() => r'510a3586dc0a4d416fe747019b307bea32aa6adc';
