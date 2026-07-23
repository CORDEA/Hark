// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AlertDetailViewModel)
final alertDetailViewModelProvider = AlertDetailViewModelFamily._();

final class AlertDetailViewModelProvider
    extends $AsyncNotifierProvider<AlertDetailViewModel, AlertDetailViewState> {
  AlertDetailViewModelProvider._({
    required AlertDetailViewModelFamily super.from,
    required ({String serverUrl, String alertId}) super.argument,
  }) : super(
         retry: null,
         name: r'alertDetailViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$alertDetailViewModelHash();

  @override
  String toString() {
    return r'alertDetailViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  AlertDetailViewModel create() => AlertDetailViewModel();

  @override
  bool operator ==(Object other) {
    return other is AlertDetailViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$alertDetailViewModelHash() =>
    r'fcbc48bb88d0787fd73e17f5dde5f33b5930e3cf';

final class AlertDetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          AlertDetailViewModel,
          AsyncValue<AlertDetailViewState>,
          AlertDetailViewState,
          FutureOr<AlertDetailViewState>,
          ({String serverUrl, String alertId})
        > {
  AlertDetailViewModelFamily._()
    : super(
        retry: null,
        name: r'alertDetailViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AlertDetailViewModelProvider call({
    required String serverUrl,
    required String alertId,
  }) => AlertDetailViewModelProvider._(
    argument: (serverUrl: serverUrl, alertId: alertId),
    from: this,
  );

  @override
  String toString() => r'alertDetailViewModelProvider';
}

abstract class _$AlertDetailViewModel
    extends $AsyncNotifier<AlertDetailViewState> {
  late final _$args = ref.$arg as ({String serverUrl, String alertId});
  String get serverUrl => _$args.serverUrl;
  String get alertId => _$args.alertId;

  FutureOr<AlertDetailViewState> build({
    required String serverUrl,
    required String alertId,
  });
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<AlertDetailViewState>, AlertDetailViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<AlertDetailViewState>,
                AlertDetailViewState
              >,
              AsyncValue<AlertDetailViewState>,
              Object?,
              Object?
            >;
    return element.handleCreate(
      ref,
      () => build(serverUrl: _$args.serverUrl, alertId: _$args.alertId),
    );
  }
}
