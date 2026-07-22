import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/auth_reauth_notifier.dart';
import '../../../core/fcm/fcm_token_provider.dart';
import '../../current_user/data/current_user_repository.dart';
import '../data/org_profile.dart';
import '../data/org_remote_data_source.dart' show HarkApiException;
import '../data/org_repository.dart';
import '../domain/get_organizations_use_case.dart';
import '../domain/leave_organization_use_case.dart';
import 'list_organization_view_state.dart';

part 'list_organization_view_model.g.dart';

@riverpod
class ListOrganizationViewModel extends _$ListOrganizationViewModel {
  @override
  Future<List<OrganizationRowViewState>> build() async {
    final profiles = await ref.watch(getOrganizationsUseCaseProvider).execute();
    final rows = profiles.map(_initialRowFor).toList();
    // Kick off hydration after build returns — the initial list renders as
    // loading rows, then each row flips to ok / reconnect / offline as its
    // /api/me call resolves. Fan-out is unbounded here; realistic org counts
    // are single digits and each request is a single indexed lookup.
    Future.microtask(() => _hydrateAll(profiles));
    return rows;
  }

  Future<void> onRefresh() async {
    ref.invalidateSelf();
    await future;
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
    // Drop any leftover stale-token flag so a future re-connect at the same
    // URL renders as healthy instead of immediately flagging reconnect.
    ref.read(authReauthProvider.notifier).clear(serverUrl);
    ref.invalidateSelf();
  }

  Future<void> _hydrateAll(List<OrgProfile> profiles) async {
    // If the reauth notifier already flagged a URL (e.g. from a background
    // FCM request earlier), start it in the reconnect state and skip the
    // fetch — the JWT is known-stale.
    final stale = ref.read(authReauthProvider);
    await Future.wait([
      for (final p in profiles)
        if (stale.contains(p.serverUrl))
          Future.sync(
            () => _updateRow(p.serverUrl, const OrgRowStatus.reconnect()),
          )
        else
          _hydrateOne(p),
    ]);
  }

  Future<void> _hydrateOne(OrgProfile profile) async {
    try {
      final current = await ref
          .read(currentUserRepositoryProvider)
          .fetch(profile);
      _updateRow(
        profile.serverUrl,
        OrgRowStatus.ok(
          orgName: current.orgName,
          devicesCount: current.devices.length,
          credentialsCount: current.credentials.length,
        ),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        _updateRow(profile.serverUrl, const OrgRowStatus.reconnect());
      } else {
        _updateRow(profile.serverUrl, const OrgRowStatus.offline());
      }
    } on HarkApiException {
      _updateRow(profile.serverUrl, const OrgRowStatus.offline());
    } catch (_) {
      _updateRow(profile.serverUrl, const OrgRowStatus.offline());
    }
  }

  void _updateRow(String serverUrl, OrgRowStatus status) {
    final list = state.value;
    if (list == null) return;
    final idx = list.indexWhere((r) => r.serverUrl == serverUrl);
    if (idx < 0) return;
    final next = [...list];
    next[idx] = next[idx].copyWith(status: status);
    state = AsyncData(next);
  }

  OrganizationRowViewState _initialRowFor(OrgProfile p) {
    final name = _hostOf(p.serverUrl);
    return OrganizationRowViewState(
      serverUrl: p.serverUrl,
      fallbackName: name,
      initials: _initials(name),
      status: const OrgRowStatus.loading(),
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
