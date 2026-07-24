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
import '../../alert_types/presentation/alert_type_lookup.dart';
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
          : context.harkColors.criticalBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(_shortOrg(serverUrl)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/');
            }
          },
        ),
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppSpacing.lg,
            right: AppSpacing.lg,
            top: AppSpacing.md,
            bottom: AppSpacing.xxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: _Content(provider: provider),
                ),
              ),
              _ActionButtons(provider: provider),
            ],
          ),
        ),
      ),
    );
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

    final type = watchAlertType(
      ref,
      serverUrl: state.serverUrl,
      typeId: state.type,
    );
    final typeColor = type?.color ?? kUnknownAlertTypeColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.md,
              vertical: AppSpacing.sm,
            ),
            decoration: BoxDecoration(
              color: typeColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              (type?.name ?? state.type).toUpperCase(),
              style: theme.textTheme.bodySmall?.copyWith(
                color: _badgeForeground(typeColor),
                fontWeight: FontWeight.w800,
                letterSpacing: 0.08,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          decoration: BoxDecoration(
            color: colors.criticalBackground,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: typeColor.withValues(alpha: 0.35)),
          ),
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _KeyValue(
                label: l10n.activeAlertRowAction,
                value: state.isSending
                    ? l10n.activeAlertActionSending
                    : l10n.activeAlertActionPending,
                colors: colors,
                valueColor: colors.warning,
                valueBold: true,
              ),
              _CriticalDivider(color: typeColor.withValues(alpha: 0.35)),
              _KeyValue(
                label: l10n.activeAlertRowTriggered,
                value: _fmtTime(state.triggeredAt),
                colors: colors,
                monoValue: true,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        _RecipientSections(state: state),
      ],
    );
  }
}

class _RecipientSections extends StatelessWidget {
  const _RecipientSections({required this.state});
  final ActiveAlertViewState state;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colors = context.harkColors;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (state.acknowledged.isNotEmpty) ...[
          _SectionLabel(
            l10n.alertDetailSectionAcknowledged(state.acknowledged.length),
            color: colors.criticalTextDim,
          ),
          const SizedBox(height: AppSpacing.sm),
          ...state.acknowledged.map(
            (r) => _AckRow(name: r.name, respondedAt: r.respondedAt),
          ),
          const SizedBox(height: AppSpacing.md),
        ],
        if (state.pending.isNotEmpty) ...[
          _SectionLabel(
            l10n.alertDetailSectionPending(state.pending.length),
            color: colors.criticalTextDim,
          ),
          const SizedBox(height: AppSpacing.sm),
          ...state.pending.map(
            (r) => Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
              child: Text(
                r.name,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colors.criticalTextDim,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
        ],
        if (state.declined.isNotEmpty) ...[
          _SectionLabel(
            l10n.alertDetailSectionDeclined(state.declined.length),
            color: colors.criticalTextDim,
          ),
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
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text, {required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: color,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class _AckRow extends StatelessWidget {
  const _AckRow({required this.name, this.respondedAt});
  final String name;
  final DateTime? respondedAt;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: theme.textTheme.titleSmall?.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          Text(
            respondedAt != null
                ? _fmtTime(respondedAt!)
                : l10n.alertDetailValueEmpty,
            style: AppTheme.monoStyle(
              theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
              ),
            ),
          ),
        ],
      ),
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
  const _CriticalDivider({required this.color});
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(vertical: 12),
      color: color,
    );
  }
}

Color _badgeForeground(Color background) {
  final l = background.computeLuminance();
  return l > 0.6 ? const Color(0xFF241A04) : Colors.white;
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
            child: state.isSending
                ? SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: theme.colorScheme.onPrimary,
                    ),
                  )
                : Text(l10n.activeAlertAck),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: state.isSending
                ? null
                : () => ref.read(provider.notifier).onDeclineTapped(),
            child: Text(l10n.activeAlertDecline),
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
