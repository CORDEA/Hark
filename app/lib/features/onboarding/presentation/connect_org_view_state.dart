import 'package:freezed_annotation/freezed_annotation.dart';

part 'connect_org_view_state.freezed.dart';

@freezed
sealed class ConnectOrgViewEvent with _$ConnectOrgViewEvent {
  const factory ConnectOrgViewEvent.none() = ConnectOrgViewEventNone;
  const factory ConnectOrgViewEvent.showSnackBar(String message) =
      ConnectOrgViewEventShowSnackBar;
  const factory ConnectOrgViewEvent.navigateToOrgs() =
      ConnectOrgViewEventNavigateToOrgs;
}

@freezed
abstract class ConnectOrgViewState with _$ConnectOrgViewState {
  const factory ConnectOrgViewState({
    @Default('') String serverUrl,
    @Default('') String invitationCode,
    @Default('') String deviceName,
    @Default(false) bool isSubmitting,
    @Default(ConnectOrgViewEvent.none()) ConnectOrgViewEvent event,
  }) = _ConnectOrgViewState;
}
