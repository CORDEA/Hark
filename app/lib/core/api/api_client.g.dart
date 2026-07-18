// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Builds a Dio client aimed at a specific org's server URL. Each org can
/// point at a different Hark deployment so we don't share a single global
/// client — callers pass in the base URL.

@ProviderFor(apiClientFactory)
final apiClientFactoryProvider = ApiClientFactoryProvider._();

/// Builds a Dio client aimed at a specific org's server URL. Each org can
/// point at a different Hark deployment so we don't share a single global
/// client — callers pass in the base URL.

final class ApiClientFactoryProvider
    extends
        $FunctionalProvider<
          ApiClientFactory,
          ApiClientFactory,
          ApiClientFactory
        >
    with $Provider<ApiClientFactory> {
  /// Builds a Dio client aimed at a specific org's server URL. Each org can
  /// point at a different Hark deployment so we don't share a single global
  /// client — callers pass in the base URL.
  ApiClientFactoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'apiClientFactoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$apiClientFactoryHash();

  @$internal
  @override
  $ProviderElement<ApiClientFactory> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiClientFactory create(Ref ref) {
    return apiClientFactory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiClientFactory value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiClientFactory>(value),
    );
  }
}

String _$apiClientFactoryHash() => r'eb2c58fe1ac6394b1cffa3c69f4a179df0f3e391';
