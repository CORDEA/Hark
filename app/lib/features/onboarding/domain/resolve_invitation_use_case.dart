import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/api/api_client.dart';
import '../data/invitation_lookup_dto.dart';
import '../data/webauthn_remote_data_source.dart';

part 'resolve_invitation_use_case.g.dart';

@riverpod
ResolveInvitationUseCase resolveInvitationUseCase(Ref ref) =>
    ResolveInvitationUseCase(ref.watch(apiClientFactoryProvider));

/// Fetches the pre-auth invitation payload so the UI can render "Join
/// {org_name}?" before the passkey ceremony starts. Runs unauthenticated
/// against the server URL scanned from the QR/link.
class ResolveInvitationUseCase {
  const ResolveInvitationUseCase(this._apiClientFactory);

  final ApiClientFactory _apiClientFactory;

  Future<InvitationLookupDto> execute({
    required String serverUrl,
    required String code,
  }) async {
    final dio = _apiClientFactory.create(serverUrl);
    final ds = WebAuthnRemoteDataSource(dio);
    return ds.lookupInvitation(code);
  }
}
