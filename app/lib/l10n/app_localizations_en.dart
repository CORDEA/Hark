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
  String get connectOrgAlreadyHaveOrgs => 'Already have organizations? ';

  @override
  String get connectOrgViewList => 'View list';

  @override
  String get connectOrgMissingFields =>
      'Enter a server URL and an invitation code';

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
  String get orgCardDisconnect => 'Disconnect';

  @override
  String activeAlertHeader(String org) {
    return 'Alert · $org';
  }

  @override
  String get activeAlertRowType => 'Type';

  @override
  String get activeAlertRowAction => 'Your action';

  @override
  String get activeAlertRowTriggered => 'Triggered';

  @override
  String get activeAlertActionSending => 'Sending…';

  @override
  String get activeAlertActionPending => 'Pending';

  @override
  String get activeAlertTypeCritical => 'Service outage';

  @override
  String get activeAlertTypeWarning => 'Warning';

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
  String activeAlertElapsed(String mm, String ss) {
    return '$mm:$ss elapsed';
  }

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
  String get alertDetailStatusActive => 'ACTIVE';

  @override
  String get alertDetailStatusResolved => 'RESOLVED';

  @override
  String get alertDetailStatusAcknowledged => 'ACKNOWLEDGED';

  @override
  String get alertDetailRowType => 'Type';

  @override
  String get alertDetailRowTarget => 'Target';

  @override
  String get alertDetailRowTriggered => 'Triggered';

  @override
  String get alertDetailRowResolved => 'Resolved';

  @override
  String get alertDetailRowResponder => 'Responder';

  @override
  String get alertDetailTargetAll => 'All subscribers';

  @override
  String get alertDetailValueEmpty => '—';

  @override
  String get historyTitle => 'History';

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
  String get historyRowTitleCritical => 'Service outage';

  @override
  String get historyRowTitleWarning => 'Warning';

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
  String historyDisconnect(String org) {
    return 'Disconnect from $org';
  }

  @override
  String get historyDisconnectDialogTitle => 'Disconnect';

  @override
  String historyDisconnectDialogBody(String org) {
    return 'This device will stop receiving alerts from $org. You can rejoin with a new invitation code.';
  }

  @override
  String get historyDisconnectDialogCancel => 'Cancel';

  @override
  String get historyDisconnectDialogConfirm => 'Disconnect';
}
