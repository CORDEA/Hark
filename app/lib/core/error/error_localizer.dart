import '../../l10n/app_localizations.dart';

abstract final class ErrorLocalizer {
  static String localize(AppLocalizations l10n, Object error) {
    switch (error) {}
    return l10n.commonError;
  }
}
