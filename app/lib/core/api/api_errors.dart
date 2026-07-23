import 'package:dio/dio.dart';

sealed class ApiError implements Exception {
  const ApiError();
}

class CredentialRevokedError extends ApiError {
  const CredentialRevokedError();
}

class GenericApiError extends ApiError {
  const GenericApiError(this.code, this.message);

  final String? code;
  final String message;

  @override
  String toString() => 'GenericApiError(${code ?? '-'}): $message';
}

/// Converts Hark's error envelope from a failed Dio response into a stable
/// domain error. Network failures remain DioExceptions for callers that need
/// to distinguish an unreachable server from a server-side response.
ApiError? mapDioError(DioException error) {
  final data = error.response?.data;
  if (data is! Map) return null;
  final envelopeError = data['error'];
  if (envelopeError is! Map) return null;
  final code = envelopeError['code'] as String?;
  final message = (envelopeError['message'] as String?) ?? 'unknown error';
  if (code == 'credential_revoked') return const CredentialRevokedError();
  return GenericApiError(code, message);
}
