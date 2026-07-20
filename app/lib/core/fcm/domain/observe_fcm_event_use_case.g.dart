// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observe_fcm_event_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ObserveFcmEventUseCase)
final observeFcmEventUseCaseProvider = ObserveFcmEventUseCaseProvider._();

final class ObserveFcmEventUseCaseProvider
    extends $NotifierProvider<ObserveFcmEventUseCase, FcmEvent> {
  ObserveFcmEventUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'observeFcmEventUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$observeFcmEventUseCaseHash();

  @$internal
  @override
  ObserveFcmEventUseCase create() => ObserveFcmEventUseCase();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FcmEvent value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FcmEvent>(value),
    );
  }
}

String _$observeFcmEventUseCaseHash() =>
    r'986a7c6a539f5fb0c4b78e496e507cd15b9fba2f';

abstract class _$ObserveFcmEventUseCase extends $Notifier<FcmEvent> {
  FcmEvent build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<FcmEvent, FcmEvent>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<FcmEvent, FcmEvent>,
              FcmEvent,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
