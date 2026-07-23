// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_organization_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ListOrganizationViewModel)
final listOrganizationViewModelProvider = ListOrganizationViewModelProvider._();

final class ListOrganizationViewModelProvider
    extends
        $AsyncNotifierProvider<
          ListOrganizationViewModel,
          List<OrganizationRowViewState>
        > {
  ListOrganizationViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listOrganizationViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listOrganizationViewModelHash();

  @$internal
  @override
  ListOrganizationViewModel create() => ListOrganizationViewModel();
}

String _$listOrganizationViewModelHash() =>
    r'3211ffe6a164f3a526f49a14363e0675f3792d2d';

abstract class _$ListOrganizationViewModel
    extends $AsyncNotifier<List<OrganizationRowViewState>> {
  FutureOr<List<OrganizationRowViewState>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<OrganizationRowViewState>>,
              List<OrganizationRowViewState>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<OrganizationRowViewState>>,
                List<OrganizationRowViewState>
              >,
              AsyncValue<List<OrganizationRowViewState>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
