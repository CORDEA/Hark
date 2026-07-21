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
    required String super.argument,
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
        '($argument)';
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
    r'4935986728c282ce18976fee1cc6e6760c14c2a0';

final class ListCredentialsViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          ListCredentialsViewModel,
          AsyncValue<ListCredentialsViewState>,
          ListCredentialsViewState,
          FutureOr<ListCredentialsViewState>,
          String
        > {
  ListCredentialsViewModelFamily._()
    : super(
        retry: null,
        name: r'listCredentialsViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ListCredentialsViewModelProvider call({required String serverUrl}) =>
      ListCredentialsViewModelProvider._(argument: serverUrl, from: this);

  @override
  String toString() => r'listCredentialsViewModelProvider';
}

abstract class _$ListCredentialsViewModel
    extends $AsyncNotifier<ListCredentialsViewState> {
  late final _$args = ref.$arg as String;
  String get serverUrl => _$args;

  FutureOr<ListCredentialsViewState> build({required String serverUrl});
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
    return element.handleCreate(ref, () => build(serverUrl: _$args));
  }
}
