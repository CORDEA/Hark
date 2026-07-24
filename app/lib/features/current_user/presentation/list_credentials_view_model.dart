import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../organizations/data/org_repository.dart';
import '../data/current_user_repository.dart';
import 'list_credentials_view_state.dart';

part 'list_credentials_view_model.g.dart';

@riverpod
class ListCredentialsViewModel extends _$ListCredentialsViewModel {
  @override
  Future<ListCredentialsViewState> build({
    required String serverUrl,
    required String userId,
  }) async {
    final profile = await ref
        .read(orgRepositoryProvider)
        .findByMembership(serverUrl, userId);
    if (profile == null) {
      throw StateError('No connected org for server $serverUrl');
    }
    final me = await ref.read(currentUserRepositoryProvider).fetch(profile);
    return ListCredentialsViewState(
      orgName: me.orgName,
      displayName: me.user.displayName,
      credentials: [
        for (final c in me.credentials)
          CredentialRowViewState(
            id: c.id,
            nickname: c.nickname,
            createdAt: c.createdAt,
            lastUsedAt: c.lastUsedAt,
          ),
      ],
      devices: [
        for (final d in me.devices)
          DeviceRowViewState(
            id: d.id,
            deviceName: d.deviceName,
            locale: d.locale,
            createdAt: d.createdAt,
          ),
      ],
    );
  }
}
