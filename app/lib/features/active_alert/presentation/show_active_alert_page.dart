import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../core/error/error_localizer.dart';
import '../../../core/theme/app_color_scheme_extension.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_theme.dart';
import '../../../l10n/app_localizations.dart';
import 'active_alert_view_model.dart';
import 'active_alert_view_state.dart';

/// Full-screen emergency UI (Screens 3 + 4 of the mobile design).
class ShowActiveAlertPage extends HookConsumerWidget {
  const ShowActiveAlertPage({
    super.key,
    required this.alertId,
    required this.serverUrl,
    required this.type,
    this.triggeredAt,
  });

  final String alertId;
  final String serverUrl;
  final String type;
  final DateTime? triggeredAt;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resolvedTriggeredAt = useMemoized(
      () => triggeredAt ?? DateTime.now().toUtc(),
      const [],
    );
    final provider = activeAlertViewModelProvider(
      alertId: alertId,
      serverUrl: serverUrl,
      type: type,
      triggeredAt: resolvedTriggeredAt,
    );

    ref.listen(provider.select((s) => s.event), (_, event) {
      switch (event) {
        case ActiveAlertViewEventRespondFailed(:final error):
          if (context.mounted) {
            final l10n = AppLocalizations.of(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(ErrorLocalizer.localize(l10n, error))),
            );
            ref.read(provider.notifier).onEventConsumed();
          }
        case ActiveAlertViewEventDismiss():
          if (context.mounted) {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          }
        case ActiveAlertViewEventNone():
          break;
      }
    });

    final isResolved = ref.watch(provider.select((s) => s.isResolved));
    return Scaffold(
      backgroundColor: isResolved
          ? Theme.of(context).scaffoldBackgroundColor
          : _bg(context, ref.watch(provider.select((s) => s.isCritical))),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _Content(provider: provider)),
              _ActionButtons(provider: provider),
            ],
          ),
        ),
      ),
    );
  }

  Color _bg(BuildContext context, bool isCritical) {
    if (!isCritical) return Theme.of(context).scaffoldBackgroundColor;
    return context.harkColors.criticalBackground;
  }
}

class _Content extends ConsumerWidget {
  const _Content({required this.provider});
  final ActiveAlertViewModelProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = context.harkColors;
    final state = ref.watch(provider);
    final l10n = AppLocalizations.of(context);

    if (state.isResolved) {
      return _ResolvedContent(state: state);
    }

    return Column(
      children: [
        Text(
          l10n.activeAlertHeader(_shortOrg(state.serverUrl)),
          style: theme.textTheme.labelSmall?.copyWith(
            color: colors.criticalTextMuted,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: state.isCritical ? colors.critical : colors.warning,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            state.type.toUpperCase(),
            style: theme.textTheme.bodySmall?.copyWith(
              color: state.isCritical
                  ? theme.colorScheme.onPrimary
                  : theme.colorScheme.onSecondary,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.08,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          decoration: BoxDecoration(
            color: colors.criticalBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colors.criticalBorder),
          ),
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _KeyValue(
                label: l10n.activeAlertRowType,
                value: state.isCritical
                    ? l10n.activeAlertTypeCritical
                    : l10n.activeAlertTypeWarning,
                colors: colors,
                valueBold: true,
              ),
              const _CriticalDivider(),
              _KeyValue(
                label: l10n.activeAlertRowAction,
                value: state.isSending
                    ? l10n.activeAlertActionSending
                    : l10n.activeAlertActionPending,
                colors: colors,
                valueColor: colors.warning,
                valueBold: true,
              ),
              const _CriticalDivider(),
              _KeyValue(
                label: l10n.activeAlertRowTriggered,
                value: _fmtTime(state.triggeredAt),
                colors: colors,
                monoValue: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          _elapsed(l10n, state.triggeredAt),
          style: AppTheme.monoStyle(
            theme.textTheme.bodySmall?.copyWith(color: colors.criticalTextDim),
          ),
        ),
      ],
    );
  }
}

class _ResolvedContent extends StatelessWidget {
  const _ResolvedContent({required this.state});
  final ActiveAlertViewState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.harkColors;
    final l10n = AppLocalizations.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.md,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: colors.borderSubtle,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            state.type.toUpperCase(),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              fontWeight: FontWeight.w800,
              letterSpacing: 0.08,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: colors.resolvedBackground,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: colors.resolvedBorder),
          ),
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            children: [
              Text(
                _resolutionHeadline(l10n, state.outcome!),
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colors.resolvedText,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                _resolutionSubtitle(l10n, state.outcome!),
                textAlign: TextAlign.center,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String _resolutionHeadline(AppLocalizations l10n, ActiveAlertOutcome outcome) {
  switch (outcome) {
    case ActiveAlertOutcome.acknowledgedByMe:
      return l10n.activeAlertResolvedByMeHeadline;
    case ActiveAlertOutcome.declinedByMe:
      return l10n.activeAlertDeclinedHeadline;
    case ActiveAlertOutcome.resolvedByOther:
      return l10n.activeAlertResolvedByOtherHeadline;
  }
}

String _resolutionSubtitle(AppLocalizations l10n, ActiveAlertOutcome outcome) {
  switch (outcome) {
    case ActiveAlertOutcome.acknowledgedByMe:
      return l10n.activeAlertResolvedByMeSubtitle;
    case ActiveAlertOutcome.declinedByMe:
      return l10n.activeAlertDeclinedSubtitle;
    case ActiveAlertOutcome.resolvedByOther:
      return l10n.activeAlertResolvedByOtherSubtitle;
  }
}

class _KeyValue extends StatelessWidget {
  const _KeyValue({
    required this.label,
    required this.value,
    required this.colors,
    this.valueColor,
    this.valueBold = false,
    this.monoValue = false,
  });
  final String label;
  final String value;
  final AppColorSchemeExtension colors;
  final Color? valueColor;
  final bool valueBold;
  final bool monoValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final effectiveValueColor = valueColor ?? theme.colorScheme.onPrimary;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: colors.criticalTextDim,
          ),
        ),
        monoValue
            ? Text(
                value,
                style: AppTheme.monoStyle(
                  theme.textTheme.bodySmall?.copyWith(
                    color: effectiveValueColor,
                  ),
                ),
              )
            : Text(
                value,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: valueBold ? FontWeight.w700 : FontWeight.w600,
                  color: effectiveValueColor,
                ),
              ),
      ],
    );
  }
}

class _CriticalDivider extends StatelessWidget {
  const _CriticalDivider();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 12),
      color: context.harkColors.criticalBorder,
    );
  }
}

class _ActionButtons extends ConsumerWidget {
  const _ActionButtons({required this.provider});
  final ActiveAlertViewModelProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final colors = context.harkColors;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    if (state.isResolved) {
      return SizedBox(
        height: 56,
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () => ref.read(provider.notifier).onDismissTapped(),
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: colors.borderSubtle),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: colors.surfaceInput,
            foregroundColor: theme.colorScheme.onSurfaceVariant,
          ),
          child: Text(l10n.activeAlertDismiss),
        ),
      );
    }

    return Column(
      children: [
        SizedBox(
          height: 64,
          width: double.infinity,
          child: FilledButton(
            onPressed: state.isSending
                ? null
                : () => ref.read(provider.notifier).onAckTapped(),
            style: FilledButton.styleFrom(
              backgroundColor: colors.critical,
              foregroundColor: theme.colorScheme.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: state.isSending
                ? SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: theme.colorScheme.onPrimary,
                    ),
                  )
                : Text(
                    l10n.activeAlertAck,
                    style: theme.textTheme.titleMedium?.copyWith(
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 56,
          width: double.infinity,
          child: OutlinedButton(
            onPressed: state.isSending
                ? null
                : () => ref.read(provider.notifier).onDeclineTapped(),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: colors.criticalBorder),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Text(
              l10n.activeAlertDecline,
              style: theme.textTheme.labelLarge?.copyWith(
                color: colors.criticalTextMuted,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

String _shortOrg(String serverUrl) {
  final u = Uri.tryParse(serverUrl);
  if (u == null || u.host.isEmpty) return serverUrl;
  return u.host;
}

String _fmtTime(DateTime t) => DateFormat('HH:mm:ss').format(t.toLocal());

String _elapsed(AppLocalizations l10n, DateTime t) {
  final d = DateTime.now().toUtc().difference(t.toUtc());
  final m = d.inMinutes;
  final s = (d.inSeconds - m * 60).clamp(0, 59);
  final fmt = NumberFormat('00');
  return l10n.activeAlertElapsed(fmt.format(m), fmt.format(s));
}
