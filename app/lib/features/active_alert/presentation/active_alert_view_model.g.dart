// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_alert_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ActiveAlertViewModel)
final activeAlertViewModelProvider = ActiveAlertViewModelFamily._();

final class ActiveAlertViewModelProvider
    extends $NotifierProvider<ActiveAlertViewModel, ActiveAlertViewState> {
  ActiveAlertViewModelProvider._({
    required ActiveAlertViewModelFamily super.from,
    required ({
      String alertId,
      String serverUrl,
      String type,
      DateTime triggeredAt,
    })
    super.argument,
  }) : super(
         retry: null,
         name: r'activeAlertViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$activeAlertViewModelHash();

  @override
  String toString() {
    return r'activeAlertViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ActiveAlertViewModel create() => ActiveAlertViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ActiveAlertViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ActiveAlertViewState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ActiveAlertViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$activeAlertViewModelHash() =>
    r'9ab574c0d35fdafe12baefcd538da7dd89a819d7';

final class ActiveAlertViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ActiveAlertViewModel,
          ActiveAlertViewState,
          ActiveAlertViewState,
          ActiveAlertViewState,
          ({
            String alertId,
            String serverUrl,
            String type,
            DateTime triggeredAt,
          })
        > {
  ActiveAlertViewModelFamily._()
    : super(
        retry: null,
        name: r'activeAlertViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ActiveAlertViewModelProvider call({
    required String alertId,
    required String serverUrl,
    required String type,
    required DateTime triggeredAt,
  }) => ActiveAlertViewModelProvider._(
    argument: (
      alertId: alertId,
      serverUrl: serverUrl,
      type: type,
      triggeredAt: triggeredAt,
    ),
    from: this,
  );

  @override
  String toString() => r'activeAlertViewModelProvider';
}

abstract class _$ActiveAlertViewModel extends $Notifier<ActiveAlertViewState> {
  late final _$args =
      ref.$arg
          as ({
            String alertId,
            String serverUrl,
            String type,
            DateTime triggeredAt,
          });
  String get alertId => _$args.alertId;
  String get serverUrl => _$args.serverUrl;
  String get type => _$args.type;
  DateTime get triggeredAt => _$args.triggeredAt;

  ActiveAlertViewState build({
    required String alertId,
    required String serverUrl,
    required String type,
    required DateTime triggeredAt,
  });
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ActiveAlertViewState, ActiveAlertViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ActiveAlertViewState, ActiveAlertViewState>,
              ActiveAlertViewState,
              Object?,
              Object?
            >;
    return element.handleCreate(
      ref,
      () => build(
        alertId: _$args.alertId,
        serverUrl: _$args.serverUrl,
        type: _$args.type,
        triggeredAt: _$args.triggeredAt,
      ),
    );
  }
}
