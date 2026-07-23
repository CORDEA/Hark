import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/error/error_localizer.dart';
import '../../../core/theme/app_color_scheme_extension.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_theme.dart';
import '../../../l10n/app_localizations.dart';
import 'alert_detail_view_model.dart';
import 'alert_detail_view_state.dart';

/// Screen 5 of the mobile design: post-ack alert detail.
class ViewAlertDetailPage extends ConsumerWidget {
  const ViewAlertDetailPage({
    super.key,
    required this.serverUrl,
    required this.alertId,
  });

  final String serverUrl;
  final String alertId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = alertDetailViewModelProvider(
      serverUrl: serverUrl,
      alertId: alertId,
    );
    final orgName = ref.watch(
      provider.select((s) => s.value?.orgName ?? serverUrl),
    );
    final async = ref.watch(provider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(pinned: true, title: Text(orgName)),
          if (async.isLoading)
            const SliverFillRemaining(
              child: Center(child: CircularProgressIndicator()),
            )
          else if (async.hasError)
            SliverFillRemaining(
              child: _ErrorView(
                error: async.error!,
                onRetry: () => ref.read(provider.notifier).onRetryTapped(),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.xl,
              ),
              sliver: SliverToBoxAdapter(
                child: _Body(state: async.requireValue),
              ),
            ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.error, required this.onRetry});
  final Object error;
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            l10n.alertDetailLoadFailed,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            ErrorLocalizer.localize(l10n, error),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          FilledButton(onPressed: onRetry, child: Text(l10n.alertDetailRetry)),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({required this.state});
  final AlertDetailViewState state;

  @override
  Widget build(BuildContext context) {
    final colors = context.harkColors;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusPills(state: state),
        const SizedBox(height: AppSpacing.md),
        _MetaCard(state: state),
        const SizedBox(height: AppSpacing.lg),
        if (state.acknowledged.isNotEmpty) ...[
          _SectionLabel(
            l10n.alertDetailSectionAcknowledged(state.acknowledged.length),
          ),
          const SizedBox(height: AppSpacing.sm),
          ...state.acknowledged.map(_ackRow),
          const SizedBox(height: AppSpacing.md),
        ],
        if (state.pending.isNotEmpty) ...[
          _SectionLabel(l10n.alertDetailSectionPending(state.pending.length)),
          const SizedBox(height: AppSpacing.sm),
          ...state.pending.map(
            (r) => Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
              child: Text(
                r.name,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
        ],
        if (state.declined.isNotEmpty) ...[
          _SectionLabel(l10n.alertDetailSectionDeclined(state.declined.length)),
          const SizedBox(height: AppSpacing.sm),
          ...state.declined.map(
            (r) => Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
              child: Text(
                r.name,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.declineText,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _ackRow(AlertDetailRecipientViewState r) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Builder(
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              r.name,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Text(
              r.respondedAt != null
                  ? _fmtTime(r.respondedAt!)
                  : AppLocalizations.of(context).alertDetailValueEmpty,
              style: AppTheme.monoStyle(
                Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(
                    context,
                  ).colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatusPills extends StatelessWidget {
  const _StatusPills({required this.state});
  final AlertDetailViewState state;
  @override
  Widget build(BuildContext context) {
    final colors = context.harkColors;
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        _Pill(
          text: state.type.toUpperCase(),
          background: state.isCritical
              ? colors.critical.withValues(alpha: 0.15)
              : colors.warning.withValues(alpha: 0.15),
          border: state.isCritical
              ? colors.critical.withValues(alpha: 0.4)
              : colors.warning.withValues(alpha: 0.4),
          foreground: state.isCritical ? colors.criticalStrong : colors.warning,
        ),
        const SizedBox(width: AppSpacing.sm),
        if (state.status == 'resolved')
          _Pill(
            text: l10n.alertDetailStatusResolved,
            background: colors.ackBackground,
            border: colors.ackBorder,
            foreground: colors.ackText,
          )
        else
          _Pill(
            text: l10n.alertDetailStatusActive,
            background: colors.critical.withValues(alpha: 0.15),
            border: colors.critical.withValues(alpha: 0.4),
            foreground: colors.criticalStrong,
          ),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.text,
    required this.background,
    required this.border,
    required this.foreground,
  });
  final String text;
  final Color background;
  final Color border;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: border),
      ),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.labelMedium?.copyWith(color: foreground),
      ),
    );
  }
}

class _MetaCard extends StatelessWidget {
  const _MetaCard({required this.state});
  final AlertDetailViewState state;
  @override
  Widget build(BuildContext context) {
    final colors = context.harkColors;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.borderSubtle),
      ),
      child: Column(
        children: [
          _row(l10n.alertDetailRowType, _typeLabel(l10n, state), context),
          _divider(colors),
          _row(
            l10n.alertDetailRowTarget,
            state.isBroadcast
                ? l10n.alertDetailTargetAll
                : state.targetNames.join(', '),
            context,
          ),
          _divider(colors),
          _row(
            l10n.alertDetailRowTriggered,
            _fmtTime(state.triggeredAt),
            context,
            mono: true,
          ),
          if (state.resolvedAt != null) ...[
            _divider(colors),
            _row(
              l10n.alertDetailRowResolved,
              _fmtTime(state.resolvedAt!),
              context,
              mono: true,
            ),
          ],
          _divider(colors),
          _row(
            l10n.alertDetailRowResponder,
            state.responderName ?? l10n.alertDetailValueEmpty,
            context,
            bold: true,
          ),
          if (state.myResponse != AlertDetailMyResponse.none) ...[
            _divider(colors),
            _row(
              l10n.alertDetailRowMyAction,
              _myActionLabel(l10n, state.myResponse),
              context,
              bold: true,
            ),
          ],
        ],
      ),
    );
  }

  static String _typeLabel(AppLocalizations l10n, AlertDetailViewState s) {
    return s.isCritical
        ? l10n.activeAlertTypeCritical
        : l10n.activeAlertTypeWarning;
  }

  static String _myActionLabel(AppLocalizations l10n, AlertDetailMyResponse r) {
    switch (r) {
      case AlertDetailMyResponse.acknowledged:
        return l10n.alertDetailMyActionAcknowledged;
      case AlertDetailMyResponse.declined:
        return l10n.alertDetailMyActionDeclined;
      case AlertDetailMyResponse.pending:
        return l10n.alertDetailMyActionPending;
      case AlertDetailMyResponse.none:
        return l10n.alertDetailMyActionNone;
    }
  }

  static Widget _divider(AppColorSchemeExtension colors) =>
      Container(height: 1, color: colors.borderSubtle);

  static Widget _row(
    String label,
    String value,
    BuildContext context, {
    bool mono = false,
    bool bold = false,
  }) {
    final theme = Theme.of(context);
    final TextStyle? valueStyle;
    if (mono) {
      valueStyle = AppTheme.monoStyle(
        theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      );
    } else if (bold) {
      valueStyle = theme.textTheme.titleSmall?.copyWith(
        fontWeight: FontWeight.w700,
        color: theme.colorScheme.onSurfaceVariant,
      );
    } else {
      valueStyle = theme.textTheme.titleSmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
      );
    }
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: valueStyle,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

String _fmtTime(DateTime t) => DateFormat('HH:mm:ss').format(t.toLocal());
