// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_settings_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ShowSettingsViewModel)
final showSettingsViewModelProvider = ShowSettingsViewModelFamily._();

final class ShowSettingsViewModelProvider
    extends $NotifierProvider<ShowSettingsViewModel, ShowSettingsViewState> {
  ShowSettingsViewModelProvider._({
    required ShowSettingsViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'showSettingsViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$showSettingsViewModelHash();

  @override
  String toString() {
    return r'showSettingsViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ShowSettingsViewModel create() => ShowSettingsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ShowSettingsViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ShowSettingsViewState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ShowSettingsViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$showSettingsViewModelHash() =>
    r'2c81545293c7850c634d8581df8b8db97cd401a2';

final class ShowSettingsViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ShowSettingsViewModel,
          ShowSettingsViewState,
          ShowSettingsViewState,
          ShowSettingsViewState,
          String
        > {
  ShowSettingsViewModelFamily._()
    : super(
        retry: null,
        name: r'showSettingsViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ShowSettingsViewModelProvider call({required String serverUrl}) =>
      ShowSettingsViewModelProvider._(argument: serverUrl, from: this);

  @override
  String toString() => r'showSettingsViewModelProvider';
}

abstract class _$ShowSettingsViewModel
    extends $Notifier<ShowSettingsViewState> {
  late final _$args = ref.$arg as String;
  String get serverUrl => _$args;

  ShowSettingsViewState build({required String serverUrl});
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ShowSettingsViewState, ShowSettingsViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ShowSettingsViewState, ShowSettingsViewState>,
              ShowSettingsViewState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(serverUrl: _$args));
  }
}
