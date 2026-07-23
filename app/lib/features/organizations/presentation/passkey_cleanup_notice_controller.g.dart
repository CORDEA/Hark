// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passkey_cleanup_notice_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PasskeyCleanupNoticeController)
final passkeyCleanupNoticeControllerProvider =
    PasskeyCleanupNoticeControllerProvider._();

final class PasskeyCleanupNoticeControllerProvider
    extends
        $NotifierProvider<
          PasskeyCleanupNoticeController,
          PasskeyCleanupNotice?
        > {
  PasskeyCleanupNoticeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'passkeyCleanupNoticeControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$passkeyCleanupNoticeControllerHash();

  @$internal
  @override
  PasskeyCleanupNoticeController create() => PasskeyCleanupNoticeController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PasskeyCleanupNotice? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PasskeyCleanupNotice?>(value),
    );
  }
}

String _$passkeyCleanupNoticeControllerHash() =>
    r'c647be63ede9e981af85175c0de52b28f89d23ca';

abstract class _$PasskeyCleanupNoticeController
    extends $Notifier<PasskeyCleanupNotice?> {
  PasskeyCleanupNotice? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PasskeyCleanupNotice?, PasskeyCleanupNotice?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PasskeyCleanupNotice?, PasskeyCleanupNotice?>,
              PasskeyCleanupNotice?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
