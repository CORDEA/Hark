// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentUserRepository)
final currentUserRepositoryProvider = CurrentUserRepositoryProvider._();

final class CurrentUserRepositoryProvider
    extends
        $FunctionalProvider<
          CurrentUserRepository,
          CurrentUserRepository,
          CurrentUserRepository
        >
    with $Provider<CurrentUserRepository> {
  CurrentUserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserRepositoryHash();

  @$internal
  @override
  $ProviderElement<CurrentUserRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CurrentUserRepository create(Ref ref) {
    return currentUserRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CurrentUserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CurrentUserRepository>(value),
    );
  }
}

String _$currentUserRepositoryHash() =>
    r'3860cfa2f6a8b45876ad8b9f5229fa27a28f8c27';
