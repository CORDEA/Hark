import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/auth_reauth_notifier.dart';
import '../../../core/api/api_errors.dart';
import '../../current_user/data/current_user_repository.dart';
import '../../onboarding/domain/add_device_via_synced_passkey_use_case.dart';
import '../data/org_profile.dart';
import '../data/org_remote_data_source.dart' show HarkApiException;
import '../data/org_repository.dart';
import '../domain/get_org_alert_severity_use_case.dart';
import '../domain/get_organizations_use_case.dart';
import 'list_organization_view_state.dart';
import 'passkey_cleanup_notice_controller.dart';
import 'passkey_cleanup_notice_dialog.dart';

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

  /// Reuses the discoverable assertion ceremony to refresh a stale JWT. A
  /// 410/credential_revoked response is the authoritative kick signal: drop
  /// the local org and guide the member to remove its orphaned passkey.
  Future<void> onReconnectTapped(String serverUrl, String userId) async {
    final row = state.asData?.value
        .where((row) => row.serverUrl == serverUrl && row.userId == userId)
        .firstOrNull;
    if (row == null) return;
    try {
      await ref
          .read(addDeviceViaSyncedPasskeyUseCaseProvider)
          .execute(serverUrl: serverUrl);
      ref.read(authReauthProvider.notifier).clear(serverUrl);
      await onRefresh();
    } on CredentialRevokedError {
      final profile = await ref
          .read(orgRepositoryProvider)
          .findByMembership(serverUrl, userId);
      if (profile != null) {
        await ref.read(orgRepositoryProvider).delete(profile);
      }
      ref
          .read(passkeyCleanupNoticeControllerProvider.notifier)
          .show(
            PasskeyCleanupNotice(
              reason: PasskeyRevocationReason.kicked,
              orgDisplayName: row.fallbackName,
              serverUrl: serverUrl,
            ),
          );
      await onRefresh();
    }
  }

  Future<void> _hydrateAll(List<OrgProfile> profiles) async {
    // If the reauth notifier already flagged a URL (e.g. from a background
    // FCM request earlier), start it in the reconnect state and skip both
    // fetches — the JWT is known-stale, so /api/alerts would come back with
    // `is_recipient = false` for everything and mis-color the row.
    final stale = ref.read(authReauthProvider);
    await Future.wait([
      for (final p in profiles)
        if (stale.contains(p.serverUrl))
          Future.sync(() => _updateStatus(p, const OrgRowStatus.reconnect()))
        else
          _hydrateOne(p),
    ]);
  }

  Future<void> _hydrateOne(OrgProfile profile) async {
    await Future.wait([_hydrateProfile(profile), _hydrateSeverity(profile)]);
  }

  Future<void> _hydrateProfile(OrgProfile profile) async {
    try {
      final current = await ref
          .read(currentUserRepositoryProvider)
          .fetch(profile);
      _updateStatus(
        profile,
        OrgRowStatus.ok(
          orgName: current.orgName,
          devicesCount: current.devices.length,
          credentialsCount: current.credentials.length,
        ),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        _updateStatus(profile, const OrgRowStatus.reconnect());
      } else {
        _updateStatus(profile, const OrgRowStatus.offline());
      }
    } on HarkApiException {
      _updateStatus(profile, const OrgRowStatus.offline());
    } catch (_) {
      _updateStatus(profile, const OrgRowStatus.offline());
    }
  }

  Future<void> _hydrateSeverity(OrgProfile profile) async {
    try {
      final severity = await ref
          .read(getOrgAlertSeverityUseCaseProvider)
          .execute(serverUrl: profile.serverUrl, userId: profile.userId);
      _updateSeverity(profile, severity);
    } catch (_) {
      // Leave the row at its default `none` severity — surfacing a stale or
      // misleading highlight is worse than showing no highlight.
    }
  }

  void _updateStatus(OrgProfile profile, OrgRowStatus status) {
    _updateRow(profile, (row) => row.copyWith(status: status));
  }

  void _updateSeverity(OrgProfile profile, OrgAlertSeverity severity) {
    _updateRow(profile, (row) => row.copyWith(severity: severity));
  }

  void _updateRow(
    OrgProfile profile,
    OrganizationRowViewState Function(OrganizationRowViewState) update,
  ) {
    final list = state.value;
    if (list == null) return;
    final idx = list.indexWhere(
      (r) => r.serverUrl == profile.serverUrl && r.userId == profile.userId,
    );
    if (idx < 0) return;
    final next = [...list];
    next[idx] = update(next[idx]);
    state = AsyncData(next);
  }

  OrganizationRowViewState _initialRowFor(OrgProfile p) {
    final name = _hostOf(p.serverUrl);
    return OrganizationRowViewState(
      serverUrl: p.serverUrl,
      userId: p.userId,
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
