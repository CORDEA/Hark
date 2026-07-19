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
    required ({String orgId, String alertId}) super.argument,
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
    r'36b8ec88fe6d359337844df4d9c3f8c3f7653ead';

final class AlertDetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          AlertDetailViewModel,
          AsyncValue<AlertDetailViewState>,
          AlertDetailViewState,
          FutureOr<AlertDetailViewState>,
          ({String orgId, String alertId})
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
    required String orgId,
    required String alertId,
  }) => AlertDetailViewModelProvider._(
    argument: (orgId: orgId, alertId: alertId),
    from: this,
  );

  @override
  String toString() => r'alertDetailViewModelProvider';
}

abstract class _$AlertDetailViewModel
    extends $AsyncNotifier<AlertDetailViewState> {
  late final _$args = ref.$arg as ({String orgId, String alertId});
  String get orgId => _$args.orgId;
  String get alertId => _$args.alertId;

  FutureOr<AlertDetailViewState> build({
    required String orgId,
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
      () => build(orgId: _$args.orgId, alertId: _$args.alertId),
    );
  }
}
