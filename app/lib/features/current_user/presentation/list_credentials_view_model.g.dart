// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_credentials_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ListCredentialsViewModel)
final listCredentialsViewModelProvider = ListCredentialsViewModelFamily._();

final class ListCredentialsViewModelProvider
    extends
        $AsyncNotifierProvider<
          ListCredentialsViewModel,
          ListCredentialsViewState
        > {
  ListCredentialsViewModelProvider._({
    required ListCredentialsViewModelFamily super.from,
    required ({String serverUrl, String userId}) super.argument,
  }) : super(
         retry: null,
         name: r'listCredentialsViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$listCredentialsViewModelHash();

  @override
  String toString() {
    return r'listCredentialsViewModelProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ListCredentialsViewModel create() => ListCredentialsViewModel();

  @override
  bool operator ==(Object other) {
    return other is ListCredentialsViewModelProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listCredentialsViewModelHash() =>
    r'02da1668831ccb3e0966677000fa467e07608546';

final class ListCredentialsViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ListCredentialsViewModel,
          AsyncValue<ListCredentialsViewState>,
          ListCredentialsViewState,
          FutureOr<ListCredentialsViewState>,
          ({String serverUrl, String userId})
        > {
  ListCredentialsViewModelFamily._()
    : super(
        retry: null,
        name: r'listCredentialsViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ListCredentialsViewModelProvider call({
    required String serverUrl,
    required String userId,
  }) => ListCredentialsViewModelProvider._(
    argument: (serverUrl: serverUrl, userId: userId),
    from: this,
  );

  @override
  String toString() => r'listCredentialsViewModelProvider';
}

abstract class _$ListCredentialsViewModel
    extends $AsyncNotifier<ListCredentialsViewState> {
  late final _$args = ref.$arg as ({String serverUrl, String userId});
  String get serverUrl => _$args.serverUrl;
  String get userId => _$args.userId;

  FutureOr<ListCredentialsViewState> build({
    required String serverUrl,
    required String userId,
  });
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<ListCredentialsViewState>,
              ListCredentialsViewState
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<ListCredentialsViewState>,
                ListCredentialsViewState
              >,
              AsyncValue<ListCredentialsViewState>,
              Object?,
              Object?
            >;
    return element.handleCreate(
      ref,
      () => build(serverUrl: _$args.serverUrl, userId: _$args.userId),
    );
  }
}
