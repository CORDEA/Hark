// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_organization_use_case.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(leaveOrganizationUseCase)
final leaveOrganizationUseCaseProvider = LeaveOrganizationUseCaseProvider._();

final class LeaveOrganizationUseCaseProvider
    extends
        $FunctionalProvider<
          LeaveOrganizationUseCase,
          LeaveOrganizationUseCase,
          LeaveOrganizationUseCase
        >
    with $Provider<LeaveOrganizationUseCase> {
  LeaveOrganizationUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'leaveOrganizationUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$leaveOrganizationUseCaseHash();

  @$internal
  @override
  $ProviderElement<LeaveOrganizationUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LeaveOrganizationUseCase create(Ref ref) {
    return leaveOrganizationUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LeaveOrganizationUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LeaveOrganizationUseCase>(value),
    );
  }
}

String _$leaveOrganizationUseCaseHash() =>
    r'9dc4fb42926962ed6d32a1784c550aec54e668d7';
