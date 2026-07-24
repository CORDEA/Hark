import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/error/error_localizer.dart';
import '../../../core/theme/app_color_scheme_extension.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../l10n/app_localizations.dart';
import 'list_organization_view_model.dart';
import 'organization_card.dart';
import 'passkey_cleanup_notice_controller.dart';
import 'passkey_cleanup_notice_dialog.dart';

class ListOrganizationPage extends ConsumerWidget {
  const ListOrganizationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = context.harkColors;
    final l10n = AppLocalizations.of(context);

    ref.listen(passkeyCleanupNoticeControllerProvider, (_, notice) {
      if (notice == null || !context.mounted) return;
      showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (_) => PasskeyCleanupNoticeDialog(
          reason: notice.reason,
          orgDisplayName: notice.orgDisplayName,
          serverUrl: notice.serverUrl,
        ),
      ).whenComplete(
        () =>
            ref.read(passkeyCleanupNoticeControllerProvider.notifier).dismiss(),
      );
    });

    return Scaffold(
      appBar: AppBar(title: Text(l10n.orgListTitle)),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.md),
              Text(
                l10n.orgListSubtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Expanded(child: _OrgList(colors: colors)),
              const SizedBox(height: AppSpacing.md),
              OutlinedButton(
                onPressed: () => context.go('/connect'),
                child: Text(l10n.orgListAdd),
              ),
              const SizedBox(height: AppSpacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrgList extends ConsumerWidget {
  const _OrgList({required this.colors});
  final AppColorSchemeExtension colors;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(listOrganizationViewModelProvider);
    return async.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(
        child: Text(
          ErrorLocalizer.localize(AppLocalizations.of(context), e),
          style: TextStyle(color: colors.declineText),
        ),
      ),
      data: (rows) {
        return RefreshIndicator(
          onRefresh: () =>
              ref.read(listOrganizationViewModelProvider.notifier).onRefresh(),
          child: rows.isEmpty
              ? LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: _EmptyState(colors: colors),
                    ),
                  ),
                )
              : ListView.separated(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: rows.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (context, i) {
                    final row = rows[i];
                    return OrganizationCard(
                      row: row,
                      onReconnect: () => ref
                          .read(listOrganizationViewModelProvider.notifier)
                          .onReconnectTapped(row.serverUrl, row.userId),
                      onOpen: () => context.push(
                        Uri(
                          path:
                              '/orgs/${Uri.encodeComponent(row.serverUrl)}/${Uri.encodeComponent(row.userId)}/history',
                        ).toString(),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.colors});
  final AppColorSchemeExtension colors;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.notifications_off_outlined,
            size: 48,
            color: colors.borderSubtle,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(l10n.orgListEmptyHeadline, style: theme.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.orgListEmptyBody,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
