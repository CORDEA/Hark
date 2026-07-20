// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HistoryViewModel)
final historyViewModelProvider = HistoryViewModelFamily._();

final class HistoryViewModelProvider
    extends $AsyncNotifierProvider<HistoryViewModel, HistoryViewState> {
  HistoryViewModelProvider._({
    required HistoryViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'historyViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$historyViewModelHash();

  @override
  String toString() {
    return r'historyViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  HistoryViewModel create() => HistoryViewModel();

  @override
  bool operator ==(Object other) {
    return other is HistoryViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$historyViewModelHash() => r'1e7ae7f786e9f00d6c1f5d8258b606c7ab22d255';

final class HistoryViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          HistoryViewModel,
          AsyncValue<HistoryViewState>,
          HistoryViewState,
          FutureOr<HistoryViewState>,
          String
        > {
  HistoryViewModelFamily._()
    : super(
        retry: null,
        name: r'historyViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HistoryViewModelProvider call({required String serverUrl}) =>
      HistoryViewModelProvider._(argument: serverUrl, from: this);

  @override
  String toString() => r'historyViewModelProvider';
}

abstract class _$HistoryViewModel extends $AsyncNotifier<HistoryViewState> {
  late final _$args = ref.$arg as String;
  String get serverUrl => _$args;

  FutureOr<HistoryViewState> build({required String serverUrl});
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<HistoryViewState>, HistoryViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HistoryViewState>, HistoryViewState>,
              AsyncValue<HistoryViewState>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(serverUrl: _$args));
  }
}
