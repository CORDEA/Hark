import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/app_color_scheme_extension.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../l10n/app_localizations.dart';
import 'connect_org_view_model.dart';
import 'connect_org_view_state.dart';

class ConnectOrgPage extends HookConsumerWidget {
  const ConnectOrgPage({
    super.key,
    this.prefillServerUrl = '',
    this.prefillCode = '',
  });

  final String prefillServerUrl;
  final String prefillCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = connectOrgViewModelProvider(
      initialServer: prefillServerUrl,
      initialCode: prefillCode,
    );
    final serverController = useTextEditingController(text: prefillServerUrl);
    final codeController = useTextEditingController(text: prefillCode);
    final theme = Theme.of(context);
    final colors = context.harkColors;
    final l10n = AppLocalizations.of(context);

    ref.listen(provider.select((s) => s.event), (_, event) {
      switch (event) {
        case ConnectOrgViewEventMissingFields():
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.connectOrgMissingFields)),
            );
            ref.read(provider.notifier).onEventConsumed();
          }
        case ConnectOrgViewEventRegisterFailed(:final reason):
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.connectOrgRegisterFailed(reason))),
            );
            ref.read(provider.notifier).onEventConsumed();
          }
        case ConnectOrgViewEventNavigateToOrgs():
          if (context.mounted) context.go('/orgs');
        case ConnectOrgViewEventNone():
          break;
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xxl,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: colors.critical,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Container(
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: theme.scaffoldBackgroundColor,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                l10n.connectOrgTitle,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                l10n.connectOrgSubtitle,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              _FieldLabel(text: l10n.connectOrgServerUrlLabel, colors: colors),
              const SizedBox(height: AppSpacing.xs),
              _MonoInput(
                controller: serverController,
                hint: l10n.connectOrgServerUrlHint,
                colors: colors,
                onChanged: (v) =>
                    ref.read(provider.notifier).onServerUrlChanged(v),
              ),
              const SizedBox(height: AppSpacing.md),
              _FieldLabel(
                text: l10n.connectOrgInvitationCodeLabel,
                colors: colors,
              ),
              const SizedBox(height: AppSpacing.xs),
              _MonoInput(
                controller: codeController,
                hint: l10n.connectOrgInvitationCodeHint,
                colors: colors,
                textCapitalization: TextCapitalization.characters,
                onChanged: (v) =>
                    ref.read(provider.notifier).onInvitationCodeChanged(v),
              ),
              const Spacer(),
              Consumer(
                builder: (context, ref, _) {
                  final isSubmitting = ref.watch(
                    provider.select((s) => s.isSubmitting),
                  );
                  return SizedBox(
                    height: 56,
                    child: FilledButton(
                      onPressed: isSubmitting
                          ? null
                          : () => ref.read(provider.notifier).onSubmitTapped(),
                      style: FilledButton.styleFrom(
                        backgroundColor: colors.critical,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: isSubmitting
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              l10n.connectOrgSubmit,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                    ),
                  );
                },
              ),
              const SizedBox(height: AppSpacing.md),
              Center(
                child: GestureDetector(
                  onTap: () => context.go('/orgs'),
                  child: Text.rich(
                    TextSpan(
                      text: l10n.connectOrgAlreadyHaveOrgs,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(
                          alpha: 0.6,
                        ),
                      ),
                      children: [
                        TextSpan(
                          text: l10n.connectOrgViewList,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.text, required this.colors});
  final String text;
  final AppColorSchemeExtension colors;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
        fontWeight: FontWeight.w600,
        letterSpacing: 0.02,
      ),
    );
  }
}

class _MonoInput extends StatelessWidget {
  const _MonoInput({
    required this.controller,
    required this.hint,
    required this.colors,
    required this.onChanged,
    this.textCapitalization = TextCapitalization.none,
  });
  final TextEditingController controller;
  final String hint;
  final AppColorSchemeExtension colors;
  final ValueChanged<String> onChanged;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textCapitalization: textCapitalization,
      style: const TextStyle(
        fontFamily: 'Menlo',
        fontSize: 15,
        color: Color(0xFFE4E4E7),
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'Menlo',
          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.3),
        ),
        filled: true,
        fillColor: colors.surfaceInput,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.md,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.borderSubtle),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.borderSubtle),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colors.critical),
        ),
      ),
    );
  }
}
