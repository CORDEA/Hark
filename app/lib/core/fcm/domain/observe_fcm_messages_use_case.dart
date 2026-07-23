import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../logger/app_logger.dart';
import '../data/fcm_repository.dart';
import '../hark_fcm_message.dart';
import 'create_notification_channels_use_case.dart';
import 'initialize_firebase_use_case.dart';
import 'request_notification_permission_use_case.dart';

part 'observe_fcm_messages_use_case.g.dart';

@Riverpod(keepAlive: true)
ObserveFcmMessagesUseCase observeFcmMessagesUseCase(Ref ref) {
  final useCase = ObserveFcmMessagesUseCase(
    ref.watch(initializeFirebaseUseCaseProvider),
    ref.watch(requestNotificationPermissionUseCaseProvider),
    ref.watch(createNotificationChannelsUseCaseProvider),
    ref.watch(fcmRepositoryProvider),
    ref.watch(appLoggerProvider),
  );
  ref.onDispose(useCase.dispose);
  useCase.start();
  return useCase;
}

class ObserveFcmMessagesUseCase {
  ObserveFcmMessagesUseCase(
    this._init,
    this._permission,
    this._channels,
    this._repository,
    this._logger,
  );

  final InitializeFirebaseUseCase _init;
  final RequestNotificationPermissionUseCase _permission;
  final CreateNotificationChannelsUseCase _channels;
  final FcmRepository _repository;
  final Logger _logger;

  final _controller = StreamController<HarkFcmMessage>.broadcast();
  final _subscriptions = <StreamSubscription<void>>[];

  Stream<HarkFcmMessage> get messages => _controller.stream;

  Future<void> start() async {
    final available = await _init.execute();
    if (!available) return;
    await _permission.execute();
    await _channels.execute();

    final initial = await _repository.getInitialMessage();
    if (initial != null) _emit(initial);

    _subscriptions
      ..add(
        _repository.onMessage.listen(
          _emit,
          onError: (Object e) => _logger.e('fcm foreground', error: e),
        ),
      )
      ..add(
        _repository.onMessageOpenedApp.listen(
          _emit,
          onError: (Object e) => _logger.e('fcm openApp', error: e),
        ),
      );
  }

  void _emit(RemoteMessage m) {
    final parsed = HarkFcmMessage.tryParse(m.data);
    if (parsed == null) {
      _logger.w('fcm unknown payload: ${m.data}');
      return;
    }
    _controller.add(parsed);
  }

  Future<void> dispose() async {
    for (final s in _subscriptions) {
      await s.cancel();
    }
    await _controller.close();
  }
}
