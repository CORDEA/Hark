// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_types_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Per-org catalog of alert types, keyed by id. Cached across screens so
/// history / detail / active-alert pages all share the same fetch.

@ProviderFor(AlertTypesViewModel)
final alertTypesViewModelProvider = AlertTypesViewModelFamily._();

/// Per-org catalog of alert types, keyed by id. Cached across screens so
/// history / detail / active-alert pages all share the same fetch.
final class AlertTypesViewModelProvider
    extends
        $AsyncNotifierProvider<
          AlertTypesViewModel,
          Map<String, AlertTypeViewState>
        > {
  /// Per-org catalog of alert types, keyed by id. Cached across screens so
  /// history / detail / active-alert pages all share the same fetch.
  AlertTypesViewModelProvider._({
    required AlertTypesViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'alertTypesViewModelProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$alertTypesViewModelHash();

  @override
  String toString() {
    return r'alertTypesViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AlertTypesViewModel create() => AlertTypesViewModel();

  @override
  bool operator ==(Object other) {
    return other is AlertTypesViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$alertTypesViewModelHash() =>
    r'ff8bc1b9cd8cac45ded887ae42978950ab35b128';

/// Per-org catalog of alert types, keyed by id. Cached across screens so
/// history / detail / active-alert pages all share the same fetch.

final class AlertTypesViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          AlertTypesViewModel,
          AsyncValue<Map<String, AlertTypeViewState>>,
          Map<String, AlertTypeViewState>,
          FutureOr<Map<String, AlertTypeViewState>>,
          String
        > {
  AlertTypesViewModelFamily._()
    : super(
        retry: null,
        name: r'alertTypesViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Per-org catalog of alert types, keyed by id. Cached across screens so
  /// history / detail / active-alert pages all share the same fetch.

  AlertTypesViewModelProvider call({required String serverUrl}) =>
      AlertTypesViewModelProvider._(argument: serverUrl, from: this);

  @override
  String toString() => r'alertTypesViewModelProvider';
}

/// Per-org catalog of alert types, keyed by id. Cached across screens so
/// history / detail / active-alert pages all share the same fetch.

abstract class _$AlertTypesViewModel
    extends $AsyncNotifier<Map<String, AlertTypeViewState>> {
  late final _$args = ref.$arg as String;
  String get serverUrl => _$args;

  FutureOr<Map<String, AlertTypeViewState>> build({required String serverUrl});
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<String, AlertTypeViewState>>,
              Map<String, AlertTypeViewState>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<String, AlertTypeViewState>>,
                Map<String, AlertTypeViewState>
              >,
              AsyncValue<Map<String, AlertTypeViewState>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(serverUrl: _$args));
  }
}
