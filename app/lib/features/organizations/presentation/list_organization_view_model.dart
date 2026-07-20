import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/fcm/fcm_token_provider.dart';
import '../data/org_profile.dart';
import '../data/org_repository.dart';
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

  Future<void> onLeaveTapped(String serverUrl) async {
    final target = await ref
        .read(orgRepositoryProvider)
        .findByServerUrl(serverUrl);
    if (target == null) return;
    final fcmToken = await ref.read(fcmTokenProvider.future);
    await ref
        .read(leaveOrganizationUseCaseProvider)
        .execute(target, fcmToken: fcmToken);
    ref.invalidateSelf();
  }

  OrganizationRowViewState _map(OrgProfile p) {
    final name = _hostOf(p.serverUrl);
    return OrganizationRowViewState(
      serverUrl: p.serverUrl,
      orgName: name,
      initials: _initials(name),
    );
  }

  String _hostOf(String url) {
    final u = Uri.tryParse(url);
    if (u == null || u.host.isEmpty) return url;
    return u.host;
  }

  String _initials(String name) {
    final parts = name
        .split(RegExp(r'[\s.]+'))
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
