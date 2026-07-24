// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Hark';

  @override
  String get connectOrgTitle => 'Connect to your org';

  @override
  String get connectOrgSubtitle =>
      'Join an organization to start receiving on-call alerts.';

  @override
  String get connectOrgServerUrlLabel => 'Server URL';

  @override
  String get connectOrgServerUrlHint => 'alerts.example.com';

  @override
  String get connectOrgInvitationCodeLabel => 'Invitation Code';

  @override
  String get connectOrgInvitationCodeHint => '7F2K-91QZ';

  @override
  String get connectOrgSubmit => 'Connect';

  @override
  String get connectOrgMissingFields =>
      'Enter a server URL and an invitation code';

  @override
  String get connectOrgLookup => 'Continue';

  @override
  String connectOrgConfirmTitle(String org) {
    return 'Join $org?';
  }

  @override
  String connectOrgConfirmBody(String org) {
    return 'You will create a passkey on this device that lets you receive alerts from $org.';
  }

  @override
  String connectOrgConfirmTitleAddDevice(String org) {
    return 'Add this device to $org?';
  }

  @override
  String connectOrgConfirmBodyAddDevice(String org) {
    return 'You will create an additional passkey on this device that lets you receive alerts from $org.';
  }

  @override
  String get connectOrgConfirmCta => 'Create passkey';

  @override
  String get connectOrgConfirmCancel => 'Back';

  @override
  String get connectOrgFinishing => 'Finalizing…';

  @override
  String get connectOrgPasskeyFailed =>
      'Passkey creation was cancelled or failed';

  @override
  String get connectOrgDeviceFailed =>
      'Registered, but could not enable notifications. You can retry from the org list.';

  @override
  String get connectOrgUseExistingPasskey =>
      'I already have a passkey for this server';

  @override
  String get connectOrgAssertionProgress => 'Signing in with your passkey…';

  @override
  String get commonError => 'Something went wrong. Please try again.';

  @override
  String get orgListTitle => 'Organizations';

  @override
  String get orgListSubtitle =>
      'Connected accounts receiving alerts on this device';

  @override
  String get orgListAdd => 'Add Organization';

  @override
  String get orgListEmptyHeadline => 'No organizations yet';

  @override
  String get orgListEmptyBody => 'Tap Add Organization to join one';

  @override
  String get orgCardNotificationsOn => 'Notifications on';

  @override
  String get orgCardStatusLoading => 'Checking…';

  @override
  String get orgCardStatusReconnect => 'Sign in again to reconnect';

  @override
  String get orgCardStatusOffline => 'Offline';

  @override
  String orgCardCounts(int devices, int credentials) {
    String _temp0 = intl.Intl.pluralLogic(
      devices,
      locale: localeName,
      other: '$devices devices',
      one: '$devices device',
    );
    String _temp1 = intl.Intl.pluralLogic(
      credentials,
      locale: localeName,
      other: '$credentials passkeys',
      one: '$credentials passkey',
    );
    return '$_temp0 · $_temp1';
  }

  @override
  String get activeAlertRowAction => 'Your action';

  @override
  String get activeAlertRowTriggered => 'Triggered';

  @override
  String get activeAlertActionSending => 'Sending…';

  @override
  String get activeAlertActionPending => 'Pending';

  @override
  String get activeAlertAck => 'Acknowledge — I\'m on it';

  @override
  String get activeAlertDecline => 'Decline — Can\'t respond';

  @override
  String get activeAlertDismiss => 'Dismiss';

  @override
  String get activeAlertResolvedByMeHeadline => 'Acknowledged';

  @override
  String get activeAlertResolvedByMeSubtitle => 'You are on it';

  @override
  String get activeAlertDeclinedHeadline => 'Declined';

  @override
  String get activeAlertDeclinedSubtitle => 'Marked as unavailable';

  @override
  String get activeAlertResolvedByOtherHeadline => 'Resolved by teammate';

  @override
  String get activeAlertResolvedByOtherSubtitle => 'No action needed';

  @override
  String alertDetailBack(String org) {
    return '←  $org';
  }

  @override
  String get alertDetailLoadFailed => 'Failed to load alert';

  @override
  String get alertDetailRetry => 'Retry';

  @override
  String alertDetailSectionAcknowledged(int count) {
    return 'Acknowledged ($count)';
  }

  @override
  String alertDetailSectionPending(int count) {
    return 'Pending ($count)';
  }

  @override
  String alertDetailSectionDeclined(int count) {
    return 'Declined ($count)';
  }

  @override
  String get alertDetailSectionRecipients => 'Recipients';

  @override
  String get alertDetailStatusActive => 'ACTIVE';

  @override
  String get alertDetailStatusResolved => 'RESOLVED';

  @override
  String get alertDetailStatusAcknowledged => 'ACKNOWLEDGED';

  @override
  String get alertDetailRowTarget => 'Target';

  @override
  String get alertDetailRowTriggered => 'Triggered';

  @override
  String get alertDetailRowResolved => 'Resolved';

  @override
  String get alertDetailRowMyAction => 'Your action';

  @override
  String get alertDetailMyActionAcknowledged => 'Acknowledged';

  @override
  String get alertDetailMyActionDeclined => 'Declined';

  @override
  String get alertDetailMyActionPending => 'Pending';

  @override
  String get alertDetailMyActionNone => '—';

  @override
  String get alertDetailTargetAll => 'All subscribers';

  @override
  String get alertDetailValueEmpty => '—';

  @override
  String get alertsTitle => 'Alerts';

  @override
  String get alertsSectionOngoing => 'Ongoing alerts';

  @override
  String get alertsSectionHistory => 'History';

  @override
  String get historyEmpty => 'No alerts yet';

  @override
  String historyBadgeAck(String hhmm) {
    return 'ACK $hhmm';
  }

  @override
  String get historyBadgeDeclined => 'DECLINED';

  @override
  String get historyBadgeResolved => 'RESOLVED';

  @override
  String historyTimeToday(String hhmm) {
    return 'Today · $hhmm';
  }

  @override
  String historyTimeYesterday(String hhmm) {
    return 'Yesterday · $hhmm';
  }

  @override
  String historyTimeAbsolute(String date, String hhmm) {
    return '$date · $hhmm';
  }

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsCredentials => 'Devices & passkeys';

  @override
  String settingsLeave(String org) {
    return 'Leave $org';
  }

  @override
  String get settingsLeaveDialogTitle => 'Leave organization';

  @override
  String settingsLeaveDialogBody(String org) {
    return 'Leave $org and revoke its passkey on the server? This device will stop receiving alerts. You can rejoin with a new invitation code.';
  }

  @override
  String get settingsLeaveDialogCancel => 'Cancel';

  @override
  String get settingsLeaveDialogConfirm => 'Revoke and leave';

  @override
  String get passkeyCleanupTitle => 'Passkey no longer usable';

  @override
  String passkeyCleanupBodyLeft(String org) {
    return 'You left $org. The passkey for this organization has been revoked and can no longer sign you in.';
  }

  @override
  String passkeyCleanupBodyKicked(String org) {
    return 'You were removed from $org. The passkey for this organization has been revoked and can no longer sign you in.';
  }

  @override
  String passkeyCleanupBodyLeftOffline(String org) {
    return '$org was removed from this device, but we couldn\'t confirm revocation with the server. Ask an admin to remove your account if you need to be sure.';
  }

  @override
  String passkeyCleanupInstructionsIOS(String host) {
    return 'iPhone and iPad: Settings → Passwords → search for $host → Delete.';
  }

  @override
  String get passkeyCleanupInstructionsAndroid =>
      'Android: Settings → Passwords, passkeys & accounts → your provider → find the entry → Delete.';

  @override
  String get passkeyCleanupInstructionsChrome =>
      'Chrome on desktop: chrome://settings/passkeys → find the entry → Delete.';

  @override
  String passkeyCleanupInstructionsGeneric(String host) {
    return 'In your password manager, search for $host and delete the passkey.';
  }

  @override
  String get passkeyCleanupDismiss => 'OK';

  @override
  String get credentialsTitle => 'Devices & passkeys';

  @override
  String get credentialsSectionCredentials => 'Passkeys';

  @override
  String get credentialsSectionDevices => 'Devices';

  @override
  String get credentialsEmptyCredentials => 'No passkeys registered';

  @override
  String get credentialsEmptyDevices => 'No devices receiving alerts';

  @override
  String get credentialsUnnamed => 'Passkey';

  @override
  String credentialsCreatedAt(String date) {
    return 'Added $date';
  }

  @override
  String credentialsLastUsedAt(String date) {
    return 'Last used $date';
  }

  @override
  String get credentialsNeverUsed => 'Not used yet';

  @override
  String get notificationChannelAlertName => 'Alerts';

  @override
  String get notificationChannelAlertDescription =>
      'On-call alerts that need your attention.';
}
