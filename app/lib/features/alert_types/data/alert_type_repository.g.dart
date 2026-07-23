// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_type_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(alertTypeRepository)
final alertTypeRepositoryProvider = AlertTypeRepositoryProvider._();

final class AlertTypeRepositoryProvider
    extends
        $FunctionalProvider<
          AlertTypeRepository,
          AlertTypeRepository,
          AlertTypeRepository
        >
    with $Provider<AlertTypeRepository> {
  AlertTypeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'alertTypeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$alertTypeRepositoryHash();

  @$internal
  @override
  $ProviderElement<AlertTypeRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AlertTypeRepository create(Ref ref) {
    return alertTypeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AlertTypeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AlertTypeRepository>(value),
    );
  }
}

String _$alertTypeRepositoryHash() =>
    r'f5c8ecae927c567586dc53dd00e0cd5c831d9576';
