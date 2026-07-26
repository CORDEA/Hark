import 'package:passkeys/authenticator.dart';
import 'package:passkeys/types.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'passkey_service.g.dart';

@Riverpod(keepAlive: true)
PasskeyService passkeyService(Ref ref) =>
    PasskeyService(PasskeyAuthenticator());

/// Wraps the platform's WebAuthn/passkey APIs. Input is the creation options
/// JSON as returned by `go-webauthn` (the value under `publicKey` in the
/// server's `/webauthn/register/begin` response). Output is the attestation
/// JSON the server hands back into `FinishRegistration`.
class PasskeyService {
  const PasskeyService(this._authenticator);

  final PasskeyAuthenticator _authenticator;

  Future<Map<String, dynamic>> createCredential(
    Map<String, dynamic> creationOptions,
  ) async {
    // WebAuthn makes `transports` optional on PublicKeyCredentialDescriptor.
    // go-webauthn therefore omits it in `excludeCredentials`, but passkeys
    // 2.22 deserializes it as a required List. Supply the equivalent empty
    // list before handing the options to the platform package.
    final request = RegisterRequestType.fromJson(
      _normalizeRegistrationOptions(creationOptions),
    );
    final response = await _authenticator.register(request);
    return response.toJson();
  }

  Future<Map<String, dynamic>> assertCredential(
    Map<String, dynamic> requestOptions,
  ) async {
    final request = AuthenticateRequestType.fromJson(requestOptions);
    final response = await _authenticator.authenticate(request);
    return response.toJson();
  }
}

Map<String, dynamic> _normalizeRegistrationOptions(
  Map<String, dynamic> options,
) {
  final excludeCredentials = options['excludeCredentials'];
  if (excludeCredentials is! List) return options;

  return {
    ...options,
    'excludeCredentials': excludeCredentials.map((credential) {
      if (credential is! Map) return credential;

      final descriptor = Map<String, dynamic>.from(credential);
      if (descriptor['transports'] == null) {
        descriptor['transports'] = const <String>[];
      }
      return descriptor;
    }).toList(),
  };
}
