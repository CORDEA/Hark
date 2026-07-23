import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../l10n/app_localizations.dart';
import '../data/fcm_repository.dart';

part 'create_notification_channels_use_case.g.dart';

@riverpod
CreateNotificationChannelsUseCase createNotificationChannelsUseCase(Ref ref) =>
    CreateNotificationChannelsUseCase(ref.watch(fcmRepositoryProvider));

class CreateNotificationChannelsUseCase {
  const CreateNotificationChannelsUseCase(this._repository);
  final FcmRepository _repository;

  Future<void> execute() async {
    final locale = WidgetsBinding.instance.platformDispatcher.locale;
    final l10n = await AppLocalizations.delegate.load(locale);
    await _repository.createAndroidAlertChannels(
      name: l10n.notificationChannelAlertName,
      description: l10n.notificationChannelAlertDescription,
    );
  }
}
