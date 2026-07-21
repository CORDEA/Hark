import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_credentials_view_state.freezed.dart';

@freezed
abstract class CredentialRowViewState with _$CredentialRowViewState {
  const factory CredentialRowViewState({
    required int id,
    required String nickname,
    required DateTime createdAt,
    DateTime? lastUsedAt,
  }) = _CredentialRowViewState;
}

@freezed
abstract class DeviceRowViewState with _$DeviceRowViewState {
  const factory DeviceRowViewState({
    required String id,
    required String deviceName,
    required String locale,
    required DateTime createdAt,
  }) = _DeviceRowViewState;
}

@freezed
abstract class ListCredentialsViewState with _$ListCredentialsViewState {
  const factory ListCredentialsViewState({
    required String orgName,
    required String displayName,
    required List<CredentialRowViewState> credentials,
    required List<DeviceRowViewState> devices,
  }) = _ListCredentialsViewState;
}
