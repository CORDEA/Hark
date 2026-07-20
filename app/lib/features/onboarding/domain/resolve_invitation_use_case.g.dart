// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resolve_invitation_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(resolveInvitationUseCase)
final resolveInvitationUseCaseProvider = ResolveInvitationUseCaseProvider._();

final class ResolveInvitationUseCaseProvider
    extends
        $FunctionalProvider<
          ResolveInvitationUseCase,
          ResolveInvitationUseCase,
          ResolveInvitationUseCase
        >
    with $Provider<ResolveInvitationUseCase> {
  ResolveInvitationUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resolveInvitationUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resolveInvitationUseCaseHash();

  @$internal
  @override
  $ProviderElement<ResolveInvitationUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ResolveInvitationUseCase create(Ref ref) {
    return resolveInvitationUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResolveInvitationUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResolveInvitationUseCase>(value),
    );
  }
}

String _$resolveInvitationUseCaseHash() =>
    r'5c9f392c81a5cd34df9271b05cdb67af2ce9df64';
