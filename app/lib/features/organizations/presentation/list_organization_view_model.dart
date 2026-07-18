import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/org_profile.dart';
import '../domain/get_organizations_use_case.dart';
import '../domain/leave_organization_use_case.dart';
import 'list_organization_view_state.dart';

part 'list_organization_view_model.g.dart';

@riverpod
class ListOrganizationViewModel extends _$ListOrganizationViewModel {
  @override
  Future<List<OrganizationRowViewState>> build() async {
    final orgs = await ref.watch(getOrganizationsUseCaseProvider).execute();
    return orgs.map(_map).toList();
  }

  Future<void> onLeaveTapped(String orgId) async {
    final orgs = await ref.read(getOrganizationsUseCaseProvider).execute();
    final target = orgs.where((o) => o.orgId == orgId).firstOrNull;
    if (target == null) return;
    await ref.read(leaveOrganizationUseCaseProvider).execute(target);
    ref.invalidateSelf();
  }

  OrganizationRowViewState _map(OrgProfile p) {
    return OrganizationRowViewState(
      orgId: p.orgId,
      orgName: p.orgName,
      serverUrl: p.serverUrl,
      initials: _initials(p.orgName),
    );
  }

  String _initials(String name) {
    final parts = name
        .split(RegExp(r'\s+'))
        .where((s) => s.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '·';
    if (parts.length == 1) {
      return parts.first
          .substring(0, parts.first.length.clamp(0, 2))
          .toUpperCase();
    }
    return (parts[0][0] + parts[1][0]).toUpperCase();
  }
}
