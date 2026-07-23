// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connect_org_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Drives the new-user onboarding wizard:
///
/// 1. [ConnectOrgStep.input] — user enters server URL + invitation code
/// 2. [ConnectOrgStep.confirm] — we've resolved the invitation and are
///    showing "Join {org_name}?"
/// 3. [ConnectOrgStep.registering] — passkey ceremony + JWT mint
/// 4. [ConnectOrgStep.registeringDevice] — /api/devices attaches FCM
///
/// On success we emit [ConnectOrgViewEvent.navigateToOrgs]. A device
/// registration failure after a successful passkey mint is treated as
/// non-fatal — the profile is already saved, so we still navigate but
/// surface a snackbar so the user can retry from the list page (M4).

@ProviderFor(ConnectOrgViewModel)
final connectOrgViewModelProvider = ConnectOrgViewModelFamily._();

/// Drives the new-user onboarding wizard:
///
/// 1. [ConnectOrgStep.input] — user enters server URL + invitation code
/// 2. [ConnectOrgStep.confirm] — we've resolved the invitation and are
///    showing "Join {org_name}?"
/// 3. [ConnectOrgStep.registering] — passkey ceremony + JWT mint
/// 4. [ConnectOrgStep.registeringDevice] — /api/devices attaches FCM
///
/// On success we emit [ConnectOrgViewEvent.navigateToOrgs]. A device
/// registration failure after a successful passkey mint is treated as
/// non-fatal — the profile is already saved, so we still navigate but
/// surface a snackbar so the user can retry from the list page (M4).
final class ConnectOrgViewModelProvider
    extends $NotifierProvider<ConnectOrgViewModel, ConnectOrgViewState> {
  /// Drives the new-user onboarding wizard:
  ///
  /// 1. [ConnectOrgStep.input] — user enters server URL + invitation code
  /// 2. [ConnectOrgStep.confirm] — we've resolved the invitation and are
  ///    showing "Join {org_name}?"
  /// 3. [ConnectOrgStep.registering] — passkey ceremony + JWT mint
  /// 4. [ConnectOrgStep.registeringDevice] — /api/devices attaches FCM
  ///
  /// On success we emit [ConnectOrgViewEvent.navigateToOrgs]. A device
  /// registration failure after a successful passkey mint is treated as
  /// non-fatal — the profile is already saved, so we still navigate but
  /// surface a snackbar so the user can retry from the list page (M4).
  ConnectOrgViewModelProvider._({
    required ConnectOrgViewModelFamily super.from,
    required ({String? initialServer, String? initialCode}) super.argument,
  }) : super(
         retry: null,
         name: r'connectOrgViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$connectOrgViewModelHash();

  @override
  String toString() {
    return r'connectOrgViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ConnectOrgViewModel create() => ConnectOrgViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConnectOrgViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConnectOrgViewState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ConnectOrgViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$connectOrgViewModelHash() =>
    r'a14a560a9a7808a7b3fbff5fa5aea74f0bffd49e';

/// Drives the new-user onboarding wizard:
///
/// 1. [ConnectOrgStep.input] — user enters server URL + invitation code
/// 2. [ConnectOrgStep.confirm] — we've resolved the invitation and are
///    showing "Join {org_name}?"
/// 3. [ConnectOrgStep.registering] — passkey ceremony + JWT mint
/// 4. [ConnectOrgStep.registeringDevice] — /api/devices attaches FCM
///
/// On success we emit [ConnectOrgViewEvent.navigateToOrgs]. A device
/// registration failure after a successful passkey mint is treated as
/// non-fatal — the profile is already saved, so we still navigate but
/// surface a snackbar so the user can retry from the list page (M4).

final class ConnectOrgViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ConnectOrgViewModel,
          ConnectOrgViewState,
          ConnectOrgViewState,
          ConnectOrgViewState,
          ({String? initialServer, String? initialCode})
        > {
  ConnectOrgViewModelFamily._()
    : super(
        retry: null,
        name: r'connectOrgViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Drives the new-user onboarding wizard:
  ///
  /// 1. [ConnectOrgStep.input] — user enters server URL + invitation code
  /// 2. [ConnectOrgStep.confirm] — we've resolved the invitation and are
  ///    showing "Join {org_name}?"
  /// 3. [ConnectOrgStep.registering] — passkey ceremony + JWT mint
  /// 4. [ConnectOrgStep.registeringDevice] — /api/devices attaches FCM
  ///
  /// On success we emit [ConnectOrgViewEvent.navigateToOrgs]. A device
  /// registration failure after a successful passkey mint is treated as
  /// non-fatal — the profile is already saved, so we still navigate but
  /// surface a snackbar so the user can retry from the list page (M4).

  ConnectOrgViewModelProvider call({
    String? initialServer,
    String? initialCode,
  }) => ConnectOrgViewModelProvider._(
    argument: (initialServer: initialServer, initialCode: initialCode),
    from: this,
  );

  @override
  String toString() => r'connectOrgViewModelProvider';
}

/// Drives the new-user onboarding wizard:
///
/// 1. [ConnectOrgStep.input] — user enters server URL + invitation code
/// 2. [ConnectOrgStep.confirm] — we've resolved the invitation and are
///    showing "Join {org_name}?"
/// 3. [ConnectOrgStep.registering] — passkey ceremony + JWT mint
/// 4. [ConnectOrgStep.registeringDevice] — /api/devices attaches FCM
///
/// On success we emit [ConnectOrgViewEvent.navigateToOrgs]. A device
/// registration failure after a successful passkey mint is treated as
/// non-fatal — the profile is already saved, so we still navigate but
/// surface a snackbar so the user can retry from the list page (M4).

abstract class _$ConnectOrgViewModel extends $Notifier<ConnectOrgViewState> {
  late final _$args =
      ref.$arg as ({String? initialServer, String? initialCode});
  String? get initialServer => _$args.initialServer;
  String? get initialCode => _$args.initialCode;

  ConnectOrgViewState build({String? initialServer, String? initialCode});
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ConnectOrgViewState, ConnectOrgViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ConnectOrgViewState, ConnectOrgViewState>,
              ConnectOrgViewState,
              Object?,
              Object?
            >;
    return element.handleCreate(
      ref,
      () => build(
        initialServer: _$args.initialServer,
        initialCode: _$args.initialCode,
      ),
    );
  }
}
