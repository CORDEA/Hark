import 'package:dio/dio.dart';

import '../../../core/api/api_errors.dart';
import '../../organizations/data/org_remote_data_source.dart'
    show HarkApiException;
import 'invitation_lookup_dto.dart';
import 'webauthn_dto.dart';

/// Talks to a single Hark server's onboarding endpoints. Constructed with a
/// Dio configured against the target server URL — see [ApiClientFactory].
class WebAuthnRemoteDataSource {
  WebAuthnRemoteDataSource(this._dio);

  final Dio _dio;

  Future<InvitationLookupDto> lookupInvitation(String code) async {
    final res = await _dio.get<Map<String, dynamic>>('/api/invitations/$code');
    return InvitationLookupDto.fromJson(_unwrapData(res.data));
  }

  /// Returns the flat creation-options map that the platform passkey UI
  /// consumes. The server wraps the options under `publicKey` (go-webauthn
  /// convention); we strip that wrapper so [PasskeyService.createCredential]
  /// receives the flat shape [RegisterRequestType.fromJson] expects.
  Future<Map<String, dynamic>> registerBegin({
    required String invitationCode,
    String? displayName,
  }) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/api/webauthn/register/begin',
      data: {
        'invitation_code': invitationCode,
        if (displayName != null && displayName.isNotEmpty)
          'display_name': displayName,
      },
    );
    final data = _unwrapData(res.data);
    final publicKey = data['publicKey'];
    if (publicKey is Map<String, dynamic>) return publicKey;
    return data;
  }

  Future<RegisterFinishResponseDto> registerFinish({
    required String invitationCode,
    required Map<String, dynamic> attestation,
  }) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/api/webauthn/register/finish',
      data: {'invitation_code': invitationCode, 'attestation': attestation},
    );
    return RegisterFinishResponseDto.fromJson(_unwrapData(res.data));
  }

  Future<RegisterDeviceResponseDto> registerDevice({
    required String fcmToken,
    required String deviceName,
    required String locale,
  }) async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/api/devices',
      data: {
        'fcm_token': fcmToken,
        'device_name': deviceName,
        'locale': locale,
      },
    );
    return RegisterDeviceResponseDto.fromJson(_unwrapData(res.data));
  }

  /// Discoverable-credential assertion: no user identifier required — the
  /// server returns options tied only to the RP ID. Same wrapper stripping
  /// dance as `registerBegin` since go-webauthn nests options under
  /// `publicKey`.
  Future<Map<String, dynamic>> assertionBegin() async {
    final res = await _dio.post<Map<String, dynamic>>(
      '/api/webauthn/assertion/begin',
    );
    final data = _unwrapData(res.data);
    final publicKey = data['publicKey'];
    if (publicKey is Map<String, dynamic>) return publicKey;
    return data;
  }

  Future<AssertionFinishResponseDto> assertionFinish({
    required String challenge,
    required Map<String, dynamic> assertion,
  }) async {
    try {
      final res = await _dio.post<Map<String, dynamic>>(
        '/api/webauthn/assertion/finish',
        data: {'challenge': challenge, 'assertion': assertion},
      );
      return AssertionFinishResponseDto.fromJson(_unwrapData(res.data));
    } on DioException catch (e) {
      final apiError = mapDioError(e);
      if (apiError != null) throw apiError;
      rethrow;
    }
  }
}

Map<String, dynamic> _unwrapData(Map<String, dynamic>? envelope) {
  if (envelope == null) throw const HarkApiException('empty response');
  final err = envelope['error'];
  if (err is Map<String, dynamic>) {
    throw HarkApiException(
      (err['message'] as String?) ?? 'unknown error',
      code: err['code'] as String?,
    );
  }
  final data = envelope['data'];
  if (data is Map<String, dynamic>) return data;
  return const <String, dynamic>{};
}
