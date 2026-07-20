import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/invitation_lookup_dto.dart';

part 'connect_org_view_state.freezed.dart';

/// Which step the wizard is on. The UI switches between input and confirm
/// panes based on this; passkey / device / done states drive spinners and
/// the outbound navigation.
enum ConnectOrgStep {
  /// User is entering / editing the server URL + invitation code.
  input,

  /// Invitation resolved; user is deciding whether to proceed.
  confirm,

  /// Passkey ceremony + JWT mint in progress.
  registering,

  /// JWT obtained; registering FCM device.
  registeringDevice,
}

@freezed
sealed class ConnectOrgViewEvent with _$ConnectOrgViewEvent {
  const factory ConnectOrgViewEvent.none() = ConnectOrgViewEventNone;
  const factory ConnectOrgViewEvent.missingFields() =
      ConnectOrgViewEventMissingFields;
  const factory ConnectOrgViewEvent.lookupFailed(Object error) =
      ConnectOrgViewEventLookupFailed;
  const factory ConnectOrgViewEvent.passkeyFailed(Object error) =
      ConnectOrgViewEventPasskeyFailed;
  const factory ConnectOrgViewEvent.deviceRegisterFailed(Object error) =
      ConnectOrgViewEventDeviceRegisterFailed;
  const factory ConnectOrgViewEvent.navigateToOrgs() =
      ConnectOrgViewEventNavigateToOrgs;
}

@freezed
abstract class ConnectOrgViewState with _$ConnectOrgViewState {
  const factory ConnectOrgViewState({
    @Default('') String serverUrl,
    @Default('') String invitationCode,
    @Default(ConnectOrgStep.input) ConnectOrgStep step,
    InvitationLookupDto? invitation,
    @Default(false) bool isBusy,
    @Default(ConnectOrgViewEvent.none()) ConnectOrgViewEvent event,
  }) = _ConnectOrgViewState;
}
