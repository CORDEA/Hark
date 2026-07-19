import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/app_color_scheme_extension.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../l10n/app_localizations.dart';
import 'list_organization_view_model.dart';
import 'organization_card.dart';

class ListOrganizationPage extends ConsumerWidget {
  const ListOrganizationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = context.harkColors;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.xxl),
              Text(
                l10n.orgListTitle,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                l10n.orgListSubtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Expanded(child: _OrgList(colors: colors)),
              const SizedBox(height: AppSpacing.md),
              InkWell(
                onTap: () => context.go('/connect'),
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: 52,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: colors.borderSubtle,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add, size: 20, color: Color(0xFF8A8A90)),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        l10n.orgListAdd,
                        style: theme.textTheme.bodyLarge?.copyWith(
                          color: const Color(0xFFC8C8CE),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
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
          AppLocalizations.of(context).orgListLoadFailed(e.toString()),
          style: TextStyle(color: colors.declineText),
        ),
      ),
      data: (rows) {
        if (rows.isEmpty) {
          return _EmptyState(colors: colors);
        }
        return ListView.separated(
          itemCount: rows.length,
          separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm + 4),
          itemBuilder: (context, i) {
            final row = rows[i];
            return OrganizationCard(
              row: row,
              isCurrent: i == 0,
              onLeave: () => ref
                  .read(listOrganizationViewModelProvider.notifier)
                  .onLeaveTapped(row.orgId),
              onOpen: () => context.push(
                Uri(
                  path: '/orgs/${Uri.encodeComponent(row.orgId)}/history',
                ).toString(),
              ),
            );
          },
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
          Text(
            l10n.orgListEmptyHeadline,
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.colorScheme.onSurface,
              fontWeight: FontWeight.w700,
            ),
          ),
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
