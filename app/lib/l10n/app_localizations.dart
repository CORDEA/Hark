import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en')];

  /// The application title
  ///
  /// In en, this message translates to:
  /// **'Hark'**
  String get appTitle;

  /// No description provided for @connectOrgTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect to your org'**
  String get connectOrgTitle;

  /// No description provided for @connectOrgSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join an organization to start receiving on-call alerts.'**
  String get connectOrgSubtitle;

  /// No description provided for @connectOrgServerUrlLabel.
  ///
  /// In en, this message translates to:
  /// **'Server URL'**
  String get connectOrgServerUrlLabel;

  /// No description provided for @connectOrgServerUrlHint.
  ///
  /// In en, this message translates to:
  /// **'alerts.example.com'**
  String get connectOrgServerUrlHint;

  /// No description provided for @connectOrgInvitationCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Invitation Code'**
  String get connectOrgInvitationCodeLabel;

  /// No description provided for @connectOrgInvitationCodeHint.
  ///
  /// In en, this message translates to:
  /// **'7F2K-91QZ'**
  String get connectOrgInvitationCodeHint;

  /// No description provided for @connectOrgSubmit.
  ///
  /// In en, this message translates to:
  /// **'Connect'**
  String get connectOrgSubmit;

  /// No description provided for @connectOrgMissingFields.
  ///
  /// In en, this message translates to:
  /// **'Enter a server URL and an invitation code'**
  String get connectOrgMissingFields;

  /// No description provided for @connectOrgLookup.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get connectOrgLookup;

  /// No description provided for @connectOrgConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Join {org}?'**
  String connectOrgConfirmTitle(String org);

  /// No description provided for @connectOrgConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'You will create a passkey on this device that lets you receive alerts from {org}.'**
  String connectOrgConfirmBody(String org);

  /// No description provided for @connectOrgConfirmTitleAddDevice.
  ///
  /// In en, this message translates to:
  /// **'Add this device to {org}?'**
  String connectOrgConfirmTitleAddDevice(String org);

  /// No description provided for @connectOrgConfirmBodyAddDevice.
  ///
  /// In en, this message translates to:
  /// **'You will create an additional passkey on this device that lets you receive alerts from {org}.'**
  String connectOrgConfirmBodyAddDevice(String org);

  /// No description provided for @connectOrgConfirmCta.
  ///
  /// In en, this message translates to:
  /// **'Create passkey'**
  String get connectOrgConfirmCta;

  /// No description provided for @connectOrgConfirmCancel.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get connectOrgConfirmCancel;

  /// No description provided for @connectOrgFinishing.
  ///
  /// In en, this message translates to:
  /// **'Finalizing…'**
  String get connectOrgFinishing;

  /// No description provided for @connectOrgPasskeyFailed.
  ///
  /// In en, this message translates to:
  /// **'Passkey creation was cancelled or failed'**
  String get connectOrgPasskeyFailed;

  /// No description provided for @connectOrgDeviceFailed.
  ///
  /// In en, this message translates to:
  /// **'Registered, but could not enable notifications. You can retry from the org list.'**
  String get connectOrgDeviceFailed;

  /// No description provided for @connectOrgUseExistingPasskey.
  ///
  /// In en, this message translates to:
  /// **'I already have a passkey for this server'**
  String get connectOrgUseExistingPasskey;

  /// No description provided for @connectOrgAssertionProgress.
  ///
  /// In en, this message translates to:
  /// **'Signing in with your passkey…'**
  String get connectOrgAssertionProgress;

  /// No description provided for @commonError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get commonError;

  /// No description provided for @orgListTitle.
  ///
  /// In en, this message translates to:
  /// **'Organizations'**
  String get orgListTitle;

  /// No description provided for @orgListSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Connected accounts receiving alerts on this device'**
  String get orgListSubtitle;

  /// No description provided for @orgListAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Organization'**
  String get orgListAdd;

  /// No description provided for @orgListEmptyHeadline.
  ///
  /// In en, this message translates to:
  /// **'No organizations yet'**
  String get orgListEmptyHeadline;

  /// No description provided for @orgListEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Tap Add Organization to join one'**
  String get orgListEmptyBody;

  /// No description provided for @orgCardNotificationsOn.
  ///
  /// In en, this message translates to:
  /// **'Notifications on'**
  String get orgCardNotificationsOn;

  /// No description provided for @orgCardStatusLoading.
  ///
  /// In en, this message translates to:
  /// **'Checking…'**
  String get orgCardStatusLoading;

  /// No description provided for @orgCardStatusReconnect.
  ///
  /// In en, this message translates to:
  /// **'Sign in again to reconnect'**
  String get orgCardStatusReconnect;

  /// No description provided for @orgCardStatusOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get orgCardStatusOffline;

  /// No description provided for @orgCardCounts.
  ///
  /// In en, this message translates to:
  /// **'{devices, plural, one{{devices} device} other{{devices} devices}} · {credentials, plural, one{{credentials} passkey} other{{credentials} passkeys}}'**
  String orgCardCounts(int devices, int credentials);

  /// No description provided for @activeAlertRowAction.
  ///
  /// In en, this message translates to:
  /// **'Your action'**
  String get activeAlertRowAction;

  /// No description provided for @activeAlertRowTriggered.
  ///
  /// In en, this message translates to:
  /// **'Triggered'**
  String get activeAlertRowTriggered;

  /// No description provided for @activeAlertActionSending.
  ///
  /// In en, this message translates to:
  /// **'Sending…'**
  String get activeAlertActionSending;

  /// No description provided for @activeAlertActionPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get activeAlertActionPending;

  /// No description provided for @activeAlertAck.
  ///
  /// In en, this message translates to:
  /// **'Acknowledge — I\'m on it'**
  String get activeAlertAck;

  /// No description provided for @activeAlertDecline.
  ///
  /// In en, this message translates to:
  /// **'Decline — Can\'t respond'**
  String get activeAlertDecline;

  /// No description provided for @activeAlertDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get activeAlertDismiss;

  /// No description provided for @activeAlertResolvedByMeHeadline.
  ///
  /// In en, this message translates to:
  /// **'Acknowledged'**
  String get activeAlertResolvedByMeHeadline;

  /// No description provided for @activeAlertResolvedByMeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You are on it'**
  String get activeAlertResolvedByMeSubtitle;

  /// No description provided for @activeAlertDeclinedHeadline.
  ///
  /// In en, this message translates to:
  /// **'Declined'**
  String get activeAlertDeclinedHeadline;

  /// No description provided for @activeAlertDeclinedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Marked as unavailable'**
  String get activeAlertDeclinedSubtitle;

  /// No description provided for @activeAlertResolvedByOtherHeadline.
  ///
  /// In en, this message translates to:
  /// **'Resolved by teammate'**
  String get activeAlertResolvedByOtherHeadline;

  /// No description provided for @activeAlertResolvedByOtherSubtitle.
  ///
  /// In en, this message translates to:
  /// **'No action needed'**
  String get activeAlertResolvedByOtherSubtitle;

  /// No description provided for @alertDetailBack.
  ///
  /// In en, this message translates to:
  /// **'←  {org}'**
  String alertDetailBack(String org);

  /// No description provided for @alertDetailLoadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to load alert'**
  String get alertDetailLoadFailed;

  /// No description provided for @alertDetailRetry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get alertDetailRetry;

  /// No description provided for @alertDetailSectionAcknowledged.
  ///
  /// In en, this message translates to:
  /// **'Acknowledged ({count})'**
  String alertDetailSectionAcknowledged(int count);

  /// No description provided for @alertDetailSectionPending.
  ///
  /// In en, this message translates to:
  /// **'Pending ({count})'**
  String alertDetailSectionPending(int count);

  /// No description provided for @alertDetailSectionDeclined.
  ///
  /// In en, this message translates to:
  /// **'Declined ({count})'**
  String alertDetailSectionDeclined(int count);

  /// No description provided for @alertDetailSectionRecipients.
  ///
  /// In en, this message translates to:
  /// **'Recipients'**
  String get alertDetailSectionRecipients;

  /// No description provided for @alertDetailStatusActive.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE'**
  String get alertDetailStatusActive;

  /// No description provided for @alertDetailStatusResolved.
  ///
  /// In en, this message translates to:
  /// **'RESOLVED'**
  String get alertDetailStatusResolved;

  /// No description provided for @alertDetailStatusAcknowledged.
  ///
  /// In en, this message translates to:
  /// **'ACKNOWLEDGED'**
  String get alertDetailStatusAcknowledged;

  /// No description provided for @alertDetailRowTarget.
  ///
  /// In en, this message translates to:
  /// **'Target'**
  String get alertDetailRowTarget;

  /// No description provided for @alertDetailRowTriggered.
  ///
  /// In en, this message translates to:
  /// **'Triggered'**
  String get alertDetailRowTriggered;

  /// No description provided for @alertDetailRowResolved.
  ///
  /// In en, this message translates to:
  /// **'Resolved'**
  String get alertDetailRowResolved;

  /// No description provided for @alertDetailRowMyAction.
  ///
  /// In en, this message translates to:
  /// **'Your action'**
  String get alertDetailRowMyAction;

  /// No description provided for @alertDetailMyActionAcknowledged.
  ///
  /// In en, this message translates to:
  /// **'Acknowledged'**
  String get alertDetailMyActionAcknowledged;

  /// No description provided for @alertDetailMyActionDeclined.
  ///
  /// In en, this message translates to:
  /// **'Declined'**
  String get alertDetailMyActionDeclined;

  /// No description provided for @alertDetailMyActionPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get alertDetailMyActionPending;

  /// No description provided for @alertDetailMyActionNone.
  ///
  /// In en, this message translates to:
  /// **'—'**
  String get alertDetailMyActionNone;

  /// No description provided for @alertDetailTargetAll.
  ///
  /// In en, this message translates to:
  /// **'All subscribers'**
  String get alertDetailTargetAll;

  /// No description provided for @alertDetailValueEmpty.
  ///
  /// In en, this message translates to:
  /// **'—'**
  String get alertDetailValueEmpty;

  /// No description provided for @alertsTitle.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get alertsTitle;

  /// No description provided for @alertsSectionOngoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing alerts'**
  String get alertsSectionOngoing;

  /// No description provided for @alertsSectionHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get alertsSectionHistory;

  /// No description provided for @historyEmpty.
  ///
  /// In en, this message translates to:
  /// **'No alerts yet'**
  String get historyEmpty;

  /// No description provided for @historyBadgeAck.
  ///
  /// In en, this message translates to:
  /// **'ACK {hhmm}'**
  String historyBadgeAck(String hhmm);

  /// No description provided for @historyBadgeDeclined.
  ///
  /// In en, this message translates to:
  /// **'DECLINED'**
  String get historyBadgeDeclined;

  /// No description provided for @historyBadgeResolved.
  ///
  /// In en, this message translates to:
  /// **'RESOLVED'**
  String get historyBadgeResolved;

  /// No description provided for @historyTimeToday.
  ///
  /// In en, this message translates to:
  /// **'Today · {hhmm}'**
  String historyTimeToday(String hhmm);

  /// No description provided for @historyTimeYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday · {hhmm}'**
  String historyTimeYesterday(String hhmm);

  /// No description provided for @historyTimeAbsolute.
  ///
  /// In en, this message translates to:
  /// **'{date} · {hhmm}'**
  String historyTimeAbsolute(String date, String hhmm);

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsCredentials.
  ///
  /// In en, this message translates to:
  /// **'Devices & passkeys'**
  String get settingsCredentials;

  /// No description provided for @settingsLeave.
  ///
  /// In en, this message translates to:
  /// **'Leave {org}'**
  String settingsLeave(String org);

  /// No description provided for @settingsLeaveDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave organization'**
  String get settingsLeaveDialogTitle;

  /// No description provided for @settingsLeaveDialogBody.
  ///
  /// In en, this message translates to:
  /// **'Leave {org} and revoke its passkey on the server? This device will stop receiving alerts. You can rejoin with a new invitation code.'**
  String settingsLeaveDialogBody(String org);

  /// No description provided for @settingsLeaveDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get settingsLeaveDialogCancel;

  /// No description provided for @settingsLeaveDialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Revoke and leave'**
  String get settingsLeaveDialogConfirm;

  /// No description provided for @passkeyCleanupTitle.
  ///
  /// In en, this message translates to:
  /// **'Passkey no longer usable'**
  String get passkeyCleanupTitle;

  /// No description provided for @passkeyCleanupBodyLeft.
  ///
  /// In en, this message translates to:
  /// **'You left {org}. The passkey for this organization has been revoked and can no longer sign you in.'**
  String passkeyCleanupBodyLeft(String org);

  /// No description provided for @passkeyCleanupBodyKicked.
  ///
  /// In en, this message translates to:
  /// **'You were removed from {org}. The passkey for this organization has been revoked and can no longer sign you in.'**
  String passkeyCleanupBodyKicked(String org);

  /// No description provided for @passkeyCleanupBodyLeftOffline.
  ///
  /// In en, this message translates to:
  /// **'{org} was removed from this device, but we couldn\'t confirm revocation with the server. Ask an admin to remove your account if you need to be sure.'**
  String passkeyCleanupBodyLeftOffline(String org);

  /// No description provided for @passkeyCleanupInstructionsIOS.
  ///
  /// In en, this message translates to:
  /// **'iPhone and iPad: Settings → Passwords → search for {host} → Delete.'**
  String passkeyCleanupInstructionsIOS(String host);

  /// No description provided for @passkeyCleanupInstructionsAndroid.
  ///
  /// In en, this message translates to:
  /// **'Android: Settings → Passwords, passkeys & accounts → your provider → find the entry → Delete.'**
  String get passkeyCleanupInstructionsAndroid;

  /// No description provided for @passkeyCleanupInstructionsChrome.
  ///
  /// In en, this message translates to:
  /// **'Chrome on desktop: chrome://settings/passkeys → find the entry → Delete.'**
  String get passkeyCleanupInstructionsChrome;

  /// No description provided for @passkeyCleanupInstructionsGeneric.
  ///
  /// In en, this message translates to:
  /// **'In your password manager, search for {host} and delete the passkey.'**
  String passkeyCleanupInstructionsGeneric(String host);

  /// No description provided for @passkeyCleanupDismiss.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get passkeyCleanupDismiss;

  /// No description provided for @credentialsTitle.
  ///
  /// In en, this message translates to:
  /// **'Devices & passkeys'**
  String get credentialsTitle;

  /// No description provided for @credentialsSectionCredentials.
  ///
  /// In en, this message translates to:
  /// **'Passkeys'**
  String get credentialsSectionCredentials;

  /// No description provided for @credentialsSectionDevices.
  ///
  /// In en, this message translates to:
  /// **'Devices'**
  String get credentialsSectionDevices;

  /// No description provided for @credentialsEmptyCredentials.
  ///
  /// In en, this message translates to:
  /// **'No passkeys registered'**
  String get credentialsEmptyCredentials;

  /// No description provided for @credentialsEmptyDevices.
  ///
  /// In en, this message translates to:
  /// **'No devices receiving alerts'**
  String get credentialsEmptyDevices;

  /// No description provided for @credentialsUnnamed.
  ///
  /// In en, this message translates to:
  /// **'Passkey'**
  String get credentialsUnnamed;

  /// No description provided for @credentialsCreatedAt.
  ///
  /// In en, this message translates to:
  /// **'Added {date}'**
  String credentialsCreatedAt(String date);

  /// No description provided for @credentialsLastUsedAt.
  ///
  /// In en, this message translates to:
  /// **'Last used {date}'**
  String credentialsLastUsedAt(String date);

  /// No description provided for @credentialsNeverUsed.
  ///
  /// In en, this message translates to:
  /// **'Not used yet'**
  String get credentialsNeverUsed;

  /// No description provided for @notificationChannelAlertName.
  ///
  /// In en, this message translates to:
  /// **'Alerts'**
  String get notificationChannelAlertName;

  /// No description provided for @notificationChannelAlertDescription.
  ///
  /// In en, this message translates to:
  /// **'On-call alerts that need your attention.'**
  String get notificationChannelAlertDescription;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
