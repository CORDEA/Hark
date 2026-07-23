import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'passkey_cleanup_notice_dialog.dart';

part 'passkey_cleanup_notice_controller.g.dart';

class PasskeyCleanupNotice {
  const PasskeyCleanupNotice({
    required this.reason,
    required this.orgDisplayName,
    required this.serverUrl,
  });

  final PasskeyRevocationReason reason;
  final String orgDisplayName;
  final String serverUrl;
}

@riverpod
class PasskeyCleanupNoticeController extends _$PasskeyCleanupNoticeController {
  @override
  PasskeyCleanupNotice? build() => null;

  void show(PasskeyCleanupNotice notice) => state = notice;

  void dismiss() => state = null;
}
