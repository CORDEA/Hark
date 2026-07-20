// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observe_deep_link_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appLinks)
final appLinksProvider = AppLinksProvider._();

final class AppLinksProvider
    extends $FunctionalProvider<AppLinks, AppLinks, AppLinks>
    with $Provider<AppLinks> {
  AppLinksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLinksProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLinksHash();

  @$internal
  @override
  $ProviderElement<AppLinks> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppLinks create(Ref ref) {
    return appLinks(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppLinks value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppLinks>(value),
    );
  }
}

String _$appLinksHash() => r'39355d1886153dd2f286cb5f781bb432cba55fb3';

@ProviderFor(ObserveDeepLinkUseCase)
final observeDeepLinkUseCaseProvider = ObserveDeepLinkUseCaseProvider._();

final class ObserveDeepLinkUseCaseProvider
    extends $NotifierProvider<ObserveDeepLinkUseCase, PendingDeepLink> {
  ObserveDeepLinkUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'observeDeepLinkUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$observeDeepLinkUseCaseHash();

  @$internal
  @override
  ObserveDeepLinkUseCase create() => ObserveDeepLinkUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PendingDeepLink value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PendingDeepLink>(value),
    );
  }
}

String _$observeDeepLinkUseCaseHash() =>
    r'0b8bb6cc0313e50ebf152e8c78201780e4bf72e1';

abstract class _$ObserveDeepLinkUseCase extends $Notifier<PendingDeepLink> {
  PendingDeepLink build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PendingDeepLink, PendingDeepLink>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PendingDeepLink, PendingDeepLink>,
              PendingDeepLink,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
