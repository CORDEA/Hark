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
    required ({String serverUrl, String userId}) super.argument,
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
        '$argument';
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

String _$historyViewModelHash() => r'57f4d7a5c47a749b0d49c2aa66866b76fe908e98';

final class HistoryViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          HistoryViewModel,
          AsyncValue<HistoryViewState>,
          HistoryViewState,
          FutureOr<HistoryViewState>,
          ({String serverUrl, String userId})
        > {
  HistoryViewModelFamily._()
    : super(
        retry: null,
        name: r'historyViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  HistoryViewModelProvider call({
    required String serverUrl,
    required String userId,
  }) => HistoryViewModelProvider._(
    argument: (serverUrl: serverUrl, userId: userId),
    from: this,
  );

  @override
  String toString() => r'historyViewModelProvider';
}

abstract class _$HistoryViewModel extends $AsyncNotifier<HistoryViewState> {
  late final _$args = ref.$arg as ({String serverUrl, String userId});
  String get serverUrl => _$args.serverUrl;
  String get userId => _$args.userId;

  FutureOr<HistoryViewState> build({
    required String serverUrl,
    required String userId,
  });
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
    return element.handleCreate(
      ref,
      () => build(serverUrl: _$args.serverUrl, userId: _$args.userId),
    );
  }
}
