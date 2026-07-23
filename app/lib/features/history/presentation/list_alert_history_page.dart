import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/error/error_localizer.dart';
import '../../../core/theme/app_color_scheme_extension.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../l10n/app_localizations.dart';
import 'history_view_model.dart';
import 'history_view_state.dart';

class ListAlertHistoryPage extends ConsumerWidget {
  const ListAlertHistoryPage({super.key, required this.serverUrl});

  final String serverUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = historyViewModelProvider(serverUrl: serverUrl);
    final async = ref.watch(provider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.historyTitle),
        actions: [
          IconButton(
            tooltip: l10n.settingsTitle,
            icon: const Icon(Icons.settings_outlined),
            onPressed: () => context.push(
              Uri(
                path: '/orgs/${Uri.encodeComponent(serverUrl)}/settings',
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSpacing.md),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () => ref.read(provider.notifier).onRefresh(),
              child: _RowList(rows: state.rows, serverUrl: serverUrl),
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}

class _RowList extends StatelessWidget {
  const _RowList({required this.rows, required this.serverUrl});
  final List<HistoryRowViewState> rows;
  final String serverUrl;
  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty) {
      return LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: Text(
                AppLocalizations.of(context).historyEmpty,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ),
          ),
        ),
      );
    }
    return ListView.separated(
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: rows.length,
      separatorBuilder: (_, _) =>
          Container(height: 1, color: context.harkColors.borderHairline),
      itemBuilder: (context, i) => _Row(row: rows[i], serverUrl: serverUrl),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row({required this.row, required this.serverUrl});
  final HistoryRowViewState row;
  final String serverUrl;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.harkColors;
    final l10n = AppLocalizations.of(context);
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
                color: _dotColor(row, colors),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    row.type == 'critical'
                        ? l10n.historyRowTitleCritical
                        : l10n.historyRowTitleWarning,
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
                    _timeLabel(l10n, row.triggeredAt),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
            _BadgePill(row: row),
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
        bg = colors.critical.withValues(alpha: 0.15);
        fg = colors.criticalStrong;
        label = l10n.historyBadgeOngoing;
      case HistoryRowBadge.ackedAt:
        bg = colors.ackBackground;
        fg = colors.ackText;
        label = l10n.historyBadgeAck(_hm(row.badgeAt ?? row.triggeredAt));
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

Color _dotColor(HistoryRowViewState row, AppColorSchemeExtension colors) {
  if (row.badge == HistoryRowBadge.resolved) return colors.borderSubtle;
  if (row.type == 'critical') return colors.critical;
  return colors.warning;
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
