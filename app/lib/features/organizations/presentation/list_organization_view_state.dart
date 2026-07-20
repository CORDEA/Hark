import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_organization_view_state.freezed.dart';

@freezed
abstract class OrganizationRowViewState with _$OrganizationRowViewState {
  const factory OrganizationRowViewState({
    required String serverUrl,
    required String orgName,
    required String initials,
  }) = _OrganizationRowViewState;
}
