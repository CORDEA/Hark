import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

enum PasskeyRevocationReason { leftByUser, kicked, leftOffline }

class PasskeyCleanupNoticeDialog extends StatelessWidget {
  const PasskeyCleanupNoticeDialog({
    super.key,
    required this.reason,
    required this.orgDisplayName,
    required this.serverUrl,
  });

  final PasskeyRevocationReason reason;
  final String orgDisplayName;
  final String serverUrl;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final host = Uri.tryParse(serverUrl)?.host;
    final serverHost = host == null || host.isEmpty ? serverUrl : host;
    final body = switch (reason) {
      PasskeyRevocationReason.leftByUser => l10n.passkeyCleanupBodyLeft(
        orgDisplayName,
      ),
      PasskeyRevocationReason.kicked => l10n.passkeyCleanupBodyKicked(
        orgDisplayName,
      ),
      PasskeyRevocationReason.leftOffline => l10n.passkeyCleanupBodyLeftOffline(
        orgDisplayName,
      ),
    };

    return AlertDialog(
      title: Text(l10n.passkeyCleanupTitle),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(body),
            const SizedBox(height: 16),
            Text('• ${l10n.passkeyCleanupInstructionsIOS(serverHost)}'),
            const SizedBox(height: 8),
            Text('• ${l10n.passkeyCleanupInstructionsAndroid}'),
            const SizedBox(height: 8),
            Text('• ${l10n.passkeyCleanupInstructionsChrome}'),
            const SizedBox(height: 8),
            Text('• ${l10n.passkeyCleanupInstructionsGeneric(serverHost)}'),
          ],
        ),
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.passkeyCleanupDismiss),
        ),
      ],
    );
  }
}
