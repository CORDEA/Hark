import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/app_color_scheme_extension.dart';
import '../../../core/theme/app_spacing.dart';
import 'alert_detail_view_model.dart';
import 'alert_detail_view_state.dart';

/// Screen 5 of the mobile design: post-ack alert detail.
class ViewAlertDetailPage extends ConsumerWidget {
  const ViewAlertDetailPage({
    super.key,
    required this.orgId,
    required this.alertId,
  });

  final String orgId;
  final String alertId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = alertDetailViewModelProvider(
      orgId: orgId,
      alertId: alertId,
    );
    final async = ref.watch(provider);

    return Scaffold(
      body: SafeArea(
        child: async.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => _ErrorView(
            error: e,
            onRetry: () => ref.read(provider.notifier).onRetryTapped(),
          ),
          data: (state) => _Body(state: state),
        ),
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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Failed to load alert',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '$error',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(
                context,
              ).colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          FilledButton(onPressed: onRetry, child: const Text('Retry')),
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
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.xl,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  if (context.canPop()) {
                    context.pop();
                  } else {
                    context.go('/orgs');
                  }
                },
                child: Text(
                  '←  ${state.orgName}',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          _StatusPills(state: state),
          const SizedBox(height: AppSpacing.md),
          _MetaCard(state: state),
          const SizedBox(height: AppSpacing.lg),
          if (state.acknowledged.isNotEmpty) ...[
            _SectionLabel('Acknowledged (${state.acknowledged.length})'),
            const SizedBox(height: AppSpacing.sm),
            ...state.acknowledged.map(_ackRow),
            const SizedBox(height: AppSpacing.md),
          ],
          if (state.pending.isNotEmpty) ...[
            _SectionLabel('Pending (${state.pending.length})'),
            const SizedBox(height: AppSpacing.sm),
            ...state.pending.map(
              (r) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  r.name,
                  style: TextStyle(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
          ],
          if (state.declined.isNotEmpty) ...[
            _SectionLabel('Declined (${state.declined.length})'),
            const SizedBox(height: AppSpacing.sm),
            ...state.declined.map(
              (r) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  r.name,
                  style: TextStyle(color: colors.declineText),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _ackRow(AlertDetailRecipientViewState r) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Builder(
        builder: (context) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              r.name,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              r.respondedAt != null ? _fmtTime(r.respondedAt!) : '—',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontFamily: 'Menlo',
                color: Theme.of(
                  context,
                ).colorScheme.onSurface.withValues(alpha: 0.5),
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
    final ackByMe = state.isAcknowledgedByMe;
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
            text: ackByMe ? 'ACKNOWLEDGED' : 'RESOLVED',
            background: colors.ackBackground,
            border: colors.ackBorder,
            foreground: colors.ackText,
          )
        else
          _Pill(
            text: 'ACTIVE',
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
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: border),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: foreground,
          fontWeight: FontWeight.w800,
          fontSize: 12,
          letterSpacing: 0.06,
        ),
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
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF151517),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.borderSubtle),
      ),
      child: Column(
        children: [
          _row('Type', _typeLabel(state), context),
          _divider(colors),
          _row(
            'Target',
            state.isBroadcast
                ? 'All subscribers'
                : state.targetNames.join(', '),
            context,
          ),
          _divider(colors),
          _row('Triggered', _fmtTime(state.triggeredAt), context, mono: true),
          if (state.resolvedAt != null) ...[
            _divider(colors),
            _row('Resolved', _fmtTime(state.resolvedAt!), context, mono: true),
          ],
          _divider(colors),
          _row('Responder', state.responderName ?? '—', context, bold: true),
        ],
      ),
    );
  }

  static String _typeLabel(AlertDetailViewState s) {
    return s.isCritical ? 'Service outage' : 'Warning';
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
    return Padding(
      padding: const EdgeInsets.all(16),
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
              style: TextStyle(
                fontFamily: mono ? 'Menlo' : null,
                fontWeight: bold ? FontWeight.w700 : FontWeight.w600,
                color: const Color(0xFFE4E4E7),
                fontSize: mono ? 13 : 14,
              ),
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
        letterSpacing: 0.02,
      ),
    );
  }
}

String _fmtTime(DateTime t) {
  final u = t.toUtc();
  String p(int n) => n.toString().padLeft(2, '0');
  return '${p(u.hour)}:${p(u.minute)}:${p(u.second)} UTC';
}
