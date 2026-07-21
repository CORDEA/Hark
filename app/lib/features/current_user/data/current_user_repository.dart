import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../../organizations/data/org_profile.dart';
import 'current_user_dto.dart';
import 'current_user_remote_data_source.dart';

part 'current_user_repository.g.dart';

@Riverpod(keepAlive: true)
CurrentUserRepository currentUserRepository(Ref ref) =>
    CurrentUserRepository(ref.watch(apiClientFactoryProvider));

class CurrentUserRepository {
  const CurrentUserRepository(this._apiClientFactory);

  final ApiClientFactory _apiClientFactory;

  Future<CurrentUserDto> fetch(OrgProfile profile) async {
    final dio = _apiClientFactory.create(
      profile.serverUrl,
      authToken: profile.authToken,
    );
    return CurrentUserRemoteDataSource(dio).get();
  }
}
