import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/error/error_localizer.dart';
import '../../../core/theme/app_color_scheme_extension.dart';
import '../../../l10n/app_localizations.dart';
import 'show_settings_view_model.dart';
import 'show_settings_view_state.dart';

class ShowSettingsPage extends ConsumerWidget {
  const ShowSettingsPage({super.key, required this.serverUrl});

  final String serverUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = showSettingsViewModelProvider(serverUrl: serverUrl);
    final l10n = AppLocalizations.of(context);

    ref.listen(provider.select((s) => s.event), (_, event) {
      switch (event) {
        case ShowSettingsViewEventLeaveFailed(:final error):
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(ErrorLocalizer.localize(l10n, error))),
            );
            ref.read(provider.notifier).onEventConsumed();
          }
        case ShowSettingsViewEventNavigateToOrgs():
          if (context.mounted) context.go('/');
        case ShowSettingsViewEventNone():
          break;
      }
    });

    final orgName = ref.watch(provider.select((s) => s.orgName));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: SafeArea(
        top: false,
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.key_outlined),
              title: Text(l10n.settingsCredentials),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => context.push(
                Uri(
                  path: '/orgs/${Uri.encodeComponent(serverUrl)}/credentials',
                ).toString(),
              ),
            ),
            _LeaveTile(provider: provider, orgName: orgName),
          ],
        ),
      ),
    );
  }
}

class _LeaveTile extends ConsumerWidget {
  const _LeaveTile({required this.provider, required this.orgName});
  final ShowSettingsViewModelProvider provider;
  final String orgName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final colors = context.harkColors;
    final isLeaving = ref.watch(provider.select((s) => s.isLeaving));
    return ListTile(
      leading: Icon(Icons.logout, color: colors.critical),
      title: Text(
        l10n.settingsLeave(orgName),
        style: TextStyle(color: colors.critical),
      ),
      trailing: isLeaving
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : null,
      onTap: isLeaving
          ? null
          : () async {
              final ok = await _confirmLeave(context, orgName);
              if (ok && context.mounted) {
                ref.read(provider.notifier).onLeaveTapped();
              }
            },
    );
  }
}

Future<bool> _confirmLeave(BuildContext context, String orgName) async {
  final l10n = AppLocalizations.of(context);
  final result = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(l10n.settingsLeaveDialogTitle),
      content: Text(l10n.settingsLeaveDialogBody(orgName)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: Text(l10n.settingsLeaveDialogCancel),
        ),
        FilledButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          child: Text(l10n.settingsLeaveDialogConfirm),
        ),
      ],
    ),
  );
  return result ?? false;
}
