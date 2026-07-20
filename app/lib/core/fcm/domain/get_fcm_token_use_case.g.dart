// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_fcm_token_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getFcmTokenUseCase)
final getFcmTokenUseCaseProvider = GetFcmTokenUseCaseProvider._();

final class GetFcmTokenUseCaseProvider
    extends
        $FunctionalProvider<
          GetFcmTokenUseCase,
          GetFcmTokenUseCase,
          GetFcmTokenUseCase
        >
    with $Provider<GetFcmTokenUseCase> {
  GetFcmTokenUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getFcmTokenUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getFcmTokenUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetFcmTokenUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetFcmTokenUseCase create(Ref ref) {
    return getFcmTokenUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetFcmTokenUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetFcmTokenUseCase>(value),
    );
  }
}

String _$getFcmTokenUseCaseHash() =>
    r'f65ed2a15eb1ca1ae393e52a4c7219e234bb92b0';
