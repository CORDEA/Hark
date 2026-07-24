import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/error/error_localizer.dart';
import '../../../core/theme/app_color_scheme_extension.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../l10n/app_localizations.dart';
import 'list_credentials_view_model.dart';
import 'list_credentials_view_state.dart';

class ListCredentialsPage extends ConsumerWidget {
  const ListCredentialsPage({
    super.key,
    required this.serverUrl,
    required this.userId,
  });

  final String serverUrl;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = listCredentialsViewModelProvider(
      serverUrl: serverUrl,
      userId: userId,
    );
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.credentialsTitle)),
      body: SafeArea(
        top: false,
        child: Consumer(
          builder: (context, ref, _) {
            final async = ref.watch(provider);
            return async.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) =>
                  Center(child: Text(ErrorLocalizer.localize(l10n, e))),
              data: (state) => _Body(state: state),
            );
          },
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state});
  final ListCredentialsViewState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: ListView(
        children: [
          const SizedBox(height: AppSpacing.md),
          Text(state.orgName, style: theme.textTheme.headlineSmall),
          if (state.displayName.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.xs),
            Text(
              state.displayName,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.lg),
          _SectionHeader(text: l10n.credentialsSectionCredentials),
          const SizedBox(height: AppSpacing.sm),
          if (state.credentials.isEmpty)
            _EmptyRow(text: l10n.credentialsEmptyCredentials)
          else
            ...state.credentials.map((c) => _CredentialTile(row: c)),
          const SizedBox(height: AppSpacing.lg),
          _SectionHeader(text: l10n.credentialsSectionDevices),
          const SizedBox(height: AppSpacing.sm),
          if (state.devices.isEmpty)
            _EmptyRow(text: l10n.credentialsEmptyDevices)
          else
            ...state.devices.map((d) => _DeviceTile(row: d)),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      text.toUpperCase(),
      style: theme.textTheme.labelSmall?.copyWith(
        color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
        letterSpacing: 1.2,
      ),
    );
  }
}

class _EmptyRow extends StatelessWidget {
  const _EmptyRow({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
      child: Text(
        text,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}

class _CredentialTile extends StatelessWidget {
  const _CredentialTile({required this.row});
  final CredentialRowViewState row;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final name = row.nickname.isNotEmpty
        ? row.nickname
        : l10n.credentialsUnnamed;
    final lastUsed = row.lastUsedAt != null
        ? l10n.credentialsLastUsedAt(_formatDate(row.lastUsedAt!))
        : l10n.credentialsNeverUsed;
    return _Row(
      icon: Icons.key,
      title: name,
      subtitle: l10n.credentialsCreatedAt(_formatDate(row.createdAt)),
      trailing: lastUsed,
    );
  }
}

class _DeviceTile extends StatelessWidget {
  const _DeviceTile({required this.row});
  final DeviceRowViewState row;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _Row(
      icon: Icons.smartphone,
      title: row.deviceName,
      subtitle: l10n.credentialsCreatedAt(_formatDate(row.createdAt)),
      trailing: row.locale,
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.harkColors;
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.borderSubtle),
      ),
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.titleSmall),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  subtitle,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          Text(
            trailing,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}

String _formatDate(DateTime dt) {
  return DateFormat.yMMMd().format(dt.toLocal());
}
