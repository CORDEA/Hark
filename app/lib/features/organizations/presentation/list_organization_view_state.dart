import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_organization_view_state.freezed.dart';

/// Per-row status for the org list. Populated as the /api/me fan-out
/// resolves — starts at [OrgRowStatus.loading], flips to [OrgRowStatus.ok]
/// on success, [OrgRowStatus.reconnect] on 401, or [OrgRowStatus.offline]
/// for anything else so the row remains actionable (leave/reconnect) even
/// when the server is unreachable.
@freezed
sealed class OrgRowStatus with _$OrgRowStatus {
  const factory OrgRowStatus.loading() = OrgRowStatusLoading;
  const factory OrgRowStatus.ok({
    required String orgName,
    required int devicesCount,
    required int credentialsCount,
  }) = OrgRowStatusOk;
  const factory OrgRowStatus.reconnect() = OrgRowStatusReconnect;
  const factory OrgRowStatus.offline() = OrgRowStatusOffline;
}

@freezed
abstract class OrganizationRowViewState with _$OrganizationRowViewState {
  const factory OrganizationRowViewState({
    required String serverUrl,
    required String fallbackName,
    required String initials,
    required OrgRowStatus status,
  }) = _OrganizationRowViewState;
}
