import 'package:flutter/material.dart';

import '../../../core/theme/app_color_scheme_extension.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../l10n/app_localizations.dart';
import 'list_organization_view_state.dart';

class OrganizationCard extends StatelessWidget {
  const OrganizationCard({
    super.key,
    required this.row,
    required this.onOpen,
    this.onReconnect,
  });

  final OrganizationRowViewState row;
  final VoidCallback onOpen;
  final VoidCallback? onReconnect;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.harkColors;
    final title = switch (row.status) {
      OrgRowStatusOk(:final orgName) => orgName,
      _ => row.fallbackName,
    };
    final severityColor = _severityColor(row.severity, colors);
    return InkWell(
      onTap: row.status is OrgRowStatusReconnect ? onReconnect : onOpen,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: severityColor?.withValues(alpha: 0.4) ?? colors.borderSubtle,
          ),
        ),
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colors.borderSubtle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    row.initials,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: theme.textTheme.titleMedium),
                      Text(
                        row.serverUrl,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurface.withValues(
                            alpha: 0.6,
                          ),
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                if (severityColor != null)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: severityColor,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppSpacing.sm),
            Divider(color: colors.borderSubtle, height: 1),
            const SizedBox(height: AppSpacing.sm),
            _StatusLine(status: row.status, colors: colors),
          ],
        ),
      ),
    );
  }
}

Color? _severityColor(OrgAlertSeverity severity, AppColorSchemeExtension c) =>
    switch (severity) {
      OrgAlertSeverity.forMe => c.critical,
      OrgAlertSeverity.forOther => c.warning,
      OrgAlertSeverity.none => null,
    };

class _StatusLine extends StatelessWidget {
  const _StatusLine({required this.status, required this.colors});

  final OrgRowStatus status;
  final AppColorSchemeExtension colors;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final (text, color) = switch (status) {
      OrgRowStatusLoading() => (
        l10n.orgCardStatusLoading,
        theme.colorScheme.onSurface.withValues(alpha: 0.6),
      ),
      OrgRowStatusOk(:final devicesCount, :final credentialsCount) => (
        l10n.orgCardCounts(devicesCount, credentialsCount),
        theme.colorScheme.onSurface.withValues(alpha: 0.6),
      ),
      OrgRowStatusReconnect() => (l10n.orgCardStatusReconnect, colors.critical),
      OrgRowStatusOffline() => (
        l10n.orgCardStatusOffline,
        theme.colorScheme.onSurface.withValues(alpha: 0.6),
      ),
    };
    return Text(
      text,
      style: theme.textTheme.bodySmall?.copyWith(color: color),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
