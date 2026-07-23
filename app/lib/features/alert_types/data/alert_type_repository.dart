import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../organizations/data/org_profile.dart';
import '../../organizations/data/org_repository.dart';
import 'alert_type_dto.dart';
import 'alert_type_remote_data_source.dart';

part 'alert_type_repository.g.dart';

@Riverpod(keepAlive: true)
AlertTypeRepository alertTypeRepository(Ref ref) => AlertTypeRepository(
  ref.watch(orgRepositoryProvider),
  ref.watch(apiClientFactoryProvider),
);

/// Loads the operator-supplied alert-type catalog from a specific org's
/// server. The catalog is what maps an alert's `type` field (e.g. "p0") to a
/// user-visible name + color; the mobile UI needs it to render badges and
/// dots without hardcoded id branches.
class AlertTypeRepository {
  const AlertTypeRepository(this._orgs, this._apiClientFactory);

  final OrgRepository _orgs;
  final ApiClientFactory _apiClientFactory;

  Future<List<AlertTypeDto>> findAll({required String serverUrl}) async {
    final profile = await _profile(serverUrl);
    final ds = AlertTypeRemoteDataSource(
      _apiClientFactory.create(profile.serverUrl, authToken: profile.authToken),
    );
    return ds.list();
  }

  Future<OrgProfile> _profile(String serverUrl) async {
    final profile = await _orgs.findByServerUrl(serverUrl);
    if (profile == null) {
      throw StateError('No connected org for server $serverUrl');
    }
    return profile;
  }
}
