import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/error/error_localizer.dart';
import '../../../core/theme/app_color_scheme_extension.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../l10n/app_localizations.dart';
import '../../alert_types/presentation/alert_type_lookup.dart';
import 'history_view_model.dart';
import 'history_view_state.dart';

class ListAlertHistoryPage extends ConsumerWidget {
  const ListAlertHistoryPage({
    super.key,
    required this.serverUrl,
    required this.userId,
  });

  final String serverUrl;
  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = historyViewModelProvider(
      serverUrl: serverUrl,
      userId: userId,
    );
    final async = ref.watch(provider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.alertsTitle),
        actions: [
          IconButton(
            tooltip: l10n.settingsTitle,
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push(
              Uri(
                path:
                    '/orgs/${Uri.encodeComponent(serverUrl)}/${Uri.encodeComponent(userId)}/settings',
              ).toString(),
            ),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: async.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) =>
              Center(child: Text(ErrorLocalizer.localize(l10n, e))),
          data: (state) =>
              _Body(state: state, provider: provider, serverUrl: serverUrl),
        ),
      ),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    required this.state,
    required this.provider,
    required this.serverUrl,
  });
  final HistoryViewState state;
  final HistoryViewModelProvider provider;
  final String serverUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    final isEmpty = state.ongoingRows.isEmpty && state.historyRows.isEmpty;
    return RefreshIndicator(
      onRefresh: () => ref.read(provider.notifier).onRefresh(),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          if (isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  l10n.historyEmpty,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(
                      context,
                    ).colorScheme.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ),
            )
          else ...[
            if (state.ongoingRows.isNotEmpty) ...[
              PinnedHeaderSliver(
                child: _SectionHeader(label: l10n.alertsSectionOngoing),
              ),
              _RowSliver(rows: state.ongoingRows, serverUrl: serverUrl),
            ],
            if (state.historyRows.isNotEmpty) ...[
              PinnedHeaderSliver(
                child: _SectionHeader(label: l10n.alertsSectionHistory),
              ),
              _RowSliver(rows: state.historyRows, serverUrl: serverUrl),
            ],
            const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
          ],
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.surface,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.sm,
      ),
      child: Text(
        label,
        style: theme.textTheme.titleSmall?.copyWith(
          fontWeight: FontWeight.w700,
          color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
        ),
      ),
    );
  }
}

class _RowSliver extends StatelessWidget {
  const _RowSliver({required this.rows, required this.serverUrl});
  final List<HistoryRowViewState> rows;
  final String serverUrl;

  @override
  Widget build(BuildContext context) {
    final colors = context.harkColors;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      sliver: SliverList.separated(
        itemCount: rows.length,
        separatorBuilder: (_, _) =>
            Container(height: 1, color: colors.borderHairline),
        itemBuilder: (context, i) => _Row(row: rows[i], serverUrl: serverUrl),
      ),
    );
  }
}

class _Row extends ConsumerWidget {
  const _Row({required this.row, required this.serverUrl});
  final HistoryRowViewState row;
  final String serverUrl;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = context.harkColors;
    final type = watchAlertType(ref, serverUrl: serverUrl, typeId: row.type);
    final title = type?.name ?? row.type;
    final dotColor = row.badge == HistoryRowBadge.resolved
        ? colors.borderSubtle
        : type?.color ?? kUnknownAlertTypeColor;
    return InkWell(
      onTap: () => _openAlert(context, row, serverUrl),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: dotColor,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: row.badge == HistoryRowBadge.resolved
                          ? theme.colorScheme.onSurface.withValues(alpha: 0.4)
                          : theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                      decoration: row.badge == HistoryRowBadge.resolved
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    _timeLabel(AppLocalizations.of(context), row.triggeredAt),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
            if (row.badge != HistoryRowBadge.ongoing) _BadgePill(row: row),
          ],
        ),
      ),
    );
  }
}

class _BadgePill extends StatelessWidget {
  const _BadgePill({required this.row});
  final HistoryRowViewState row;
  @override
  Widget build(BuildContext context) {
    final colors = context.harkColors;
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    late Color bg;
    late Color fg;
    late String label;
    switch (row.badge) {
      case HistoryRowBadge.ongoing:
        return const SizedBox.shrink();
      case HistoryRowBadge.ackedAt:
        bg = colors.ackBackground;
        fg = colors.ackText;
        label = l10n.historyBadgeAck(
          _hm((row.badgeAt ?? row.triggeredAt).toLocal()),
        );
      case HistoryRowBadge.declined:
        bg = colors.declineBackground;
        fg = colors.declineText;
        label = l10n.historyBadgeDeclined;
      case HistoryRowBadge.resolved:
        bg = colors.resolvedBackground;
        fg = colors.resolvedText;
        label = l10n.historyBadgeResolved;
    }
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: fg,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

void _openAlert(
  BuildContext context,
  HistoryRowViewState row,
  String serverUrl,
) {
  final encoded = Uri.encodeComponent(serverUrl);
  if (row.badge == HistoryRowBadge.ongoing) {
    context.push('/orgs/$encoded/alert/${row.alertId}?type=${row.type}');
  } else {
    context.push('/orgs/$encoded/alert/${row.alertId}/detail');
  }
}

String _timeLabel(AppLocalizations l10n, DateTime iso) {
  final d = iso.toLocal();
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final dayStart = DateTime(d.year, d.month, d.day);
  final hhmm = _hm(d);
  if (dayStart == today) return l10n.historyTimeToday(hhmm);
  if (dayStart == today.subtract(const Duration(days: 1))) {
    return l10n.historyTimeYesterday(hhmm);
  }
  return l10n.historyTimeAbsolute(DateFormat('yyyy-MM-dd').format(d), hhmm);
}

String _hm(DateTime t) => DateFormat('HH:mm').format(t);
