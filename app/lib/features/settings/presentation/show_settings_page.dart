import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/error/error_localizer.dart';
import '../../../core/theme/app_color_scheme_extension.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../l10n/app_localizations.dart';
import 'show_settings_view_model.dart';
import 'show_settings_view_state.dart';

class ShowSettingsPage extends ConsumerWidget {
  const ShowSettingsPage({
    super.key,
    required this.serverUrl,
    required this.userId,
  });

  final String serverUrl;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = showSettingsViewModelProvider(
      serverUrl: serverUrl,
      userId: userId,
    );
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: ListView(
            children: [
              const SizedBox(height: AppSpacing.md),
              _SettingsCard(
                icon: Icons.key_outlined,
                title: l10n.settingsCredentials,
                onTap: () => context.push(
                  Uri(
                    path:
                        '/orgs/${Uri.encodeComponent(serverUrl)}/${Uri.encodeComponent(userId)}/credentials',
                  ).toString(),
                ),
              ),
              _LeaveCard(provider: provider, orgName: orgName),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({
    required this.icon,
    required this.title,
    required this.onTap,
    this.titleColor,
    this.iconColor,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color? titleColor;
  final Color? iconColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.harkColors;
    final effectiveIconColor = iconColor ?? theme.colorScheme.onSurfaceVariant;
    final effectiveTitleColor = titleColor ?? theme.colorScheme.onSurface;
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.borderSubtle),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                Icon(icon, color: effectiveIconColor),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: effectiveTitleColor,
                    ),
                  ),
                ),
                trailing ??
                    Icon(
                      Icons.chevron_right,
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LeaveCard extends ConsumerWidget {
  const _LeaveCard({required this.provider, required this.orgName});
  final ShowSettingsViewModelProvider provider;
  final String orgName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final colors = context.harkColors;
    final isLeaving = ref.watch(provider.select((s) => s.isLeaving));
    return _SettingsCard(
      icon: Icons.logout,
      title: l10n.settingsLeave(orgName),
      iconColor: colors.critical,
      titleColor: colors.critical,
      trailing: isLeaving
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const SizedBox.shrink(),
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
