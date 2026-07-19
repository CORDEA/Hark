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

  /// No description provided for @connectOrgAlreadyHaveOrgs.
  ///
  /// In en, this message translates to:
  /// **'Already have organizations? '**
  String get connectOrgAlreadyHaveOrgs;

  /// No description provided for @connectOrgViewList.
  ///
  /// In en, this message translates to:
  /// **'View list'**
  String get connectOrgViewList;

  /// No description provided for @connectOrgMissingFields.
  ///
  /// In en, this message translates to:
  /// **'Enter a server URL and an invitation code'**
  String get connectOrgMissingFields;

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

  /// No description provided for @orgCardDisconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get orgCardDisconnect;

  /// No description provided for @activeAlertHeader.
  ///
  /// In en, this message translates to:
  /// **'Alert · {org}'**
  String activeAlertHeader(String org);

  /// No description provided for @activeAlertRowType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get activeAlertRowType;

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

  /// No description provided for @activeAlertTypeCritical.
  ///
  /// In en, this message translates to:
  /// **'Service outage'**
  String get activeAlertTypeCritical;

  /// No description provided for @activeAlertTypeWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get activeAlertTypeWarning;

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

  /// No description provided for @activeAlertElapsed.
  ///
  /// In en, this message translates to:
  /// **'{mm}:{ss} elapsed'**
  String activeAlertElapsed(String mm, String ss);

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

  /// No description provided for @alertDetailRowType.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get alertDetailRowType;

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

  /// No description provided for @alertDetailRowResponder.
  ///
  /// In en, this message translates to:
  /// **'Responder'**
  String get alertDetailRowResponder;

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

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyTitle;

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

  /// No description provided for @historyRowTitleCritical.
  ///
  /// In en, this message translates to:
  /// **'Service outage'**
  String get historyRowTitleCritical;

  /// No description provided for @historyRowTitleWarning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get historyRowTitleWarning;

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

  /// No description provided for @historyDisconnect.
  ///
  /// In en, this message translates to:
  /// **'Disconnect from {org}'**
  String historyDisconnect(String org);

  /// No description provided for @historyDisconnectDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get historyDisconnectDialogTitle;

  /// No description provided for @historyDisconnectDialogBody.
  ///
  /// In en, this message translates to:
  /// **'This device will stop receiving alerts from {org}. You can rejoin with a new invitation code.'**
  String historyDisconnectDialogBody(String org);

  /// No description provided for @historyDisconnectDialogCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get historyDisconnectDialogCancel;

  /// No description provided for @historyDisconnectDialogConfirm.
  ///
  /// In en, this message translates to:
  /// **'Disconnect'**
  String get historyDisconnectDialogConfirm;
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
