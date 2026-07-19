import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../organizations/data/org_profile.dart';
import '../../organizations/data/org_repository.dart';
import 'alert_dto.dart';
import 'alert_remote_data_source.dart';

part 'alert_repository.g.dart';

@Riverpod(keepAlive: true)
AlertRepository alertRepository(Ref ref) => AlertRepository(
  ref.watch(orgRepositoryProvider),
  ref.watch(apiClientFactoryProvider),
);

/// Talks to a specific org's Hark server. Callers pass the [orgId] (which is
/// the server's public URL as returned by /api/register) and the repository
/// looks up the [OrgProfile] to build a Dio client and, when responding, to
/// supply the user_id the server expects.
class AlertRepository {
  const AlertRepository(this._orgs, this._apiClientFactory);

  final OrgRepository _orgs;
  final ApiClientFactory _apiClientFactory;

  Future<AlertDetailDto> findById({
    required String orgId,
    required String alertId,
  }) async {
    final ds = await _dsFor(orgId);
    return ds.getDetail(alertId);
  }

  /// [action] is `acknowledged` or `declined`.
  Future<RespondAlertResponseDto> respond({
    required String orgId,
    required String alertId,
    required String action,
  }) async {
    final profile = await _profile(orgId);
    final ds = AlertRemoteDataSource(
      _apiClientFactory.create(profile.serverUrl),
    );
    return ds.respond(
      alertId: alertId,
      body: RespondAlertRequestDto(userId: profile.userId, action: action),
    );
  }

  Future<OrgProfile> _profile(String orgId) async {
    final profile = await _orgs.findById(orgId);
    if (profile == null) {
      throw StateError('No connected org for id $orgId');
    }
    return profile;
  }

  Future<AlertRemoteDataSource> _dsFor(String orgId) async {
    final profile = await _profile(orgId);
    return AlertRemoteDataSource(_apiClientFactory.create(profile.serverUrl));
  }
}
