import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hark/core/deep_link/observe_deep_link_use_case.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/error/error_localizer.dart';
import '../../../core/theme/app_color_scheme_extension.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_theme.dart';
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
    final l10n = AppLocalizations.of(context);

    ref.listen(provider.select((s) => s.event), (_, event) {
      if (!context.mounted) return;
      switch (event) {
        case ConnectOrgViewEventMissingFields():
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.connectOrgMissingFields)));
        case ConnectOrgViewEventLookupFailed(:final error):
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(ErrorLocalizer.localize(l10n, error))),
          );
        case ConnectOrgViewEventPasskeyFailed():
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.connectOrgPasskeyFailed)));
        case ConnectOrgViewEventDeviceRegisterFailed():
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(l10n.connectOrgDeviceFailed)));
          ref.read(observeDeepLinkUseCaseProvider.notifier).consume();
          context.pop(true);
        case ConnectOrgViewEventNavigateToOrgs():
          ref.read(observeDeepLinkUseCaseProvider.notifier).consume();
          context.pop(true);
        case ConnectOrgViewEventNone():
          break;
      }
      if (context.mounted && event is! ConnectOrgViewEventNone) {
        ref.read(provider.notifier).onEventConsumed();
      }
    });

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(pinned: true, title: Text(l10n.connectOrgTitle)),
          SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.xxl,
                ),
                child: Consumer(
                  builder: (context, ref, _) {
                    final step = ref.watch(provider.select((s) => s.step));
                    switch (step) {
                      case ConnectOrgStep.input:
                        return _InputPane(
                          provider: provider,
                          serverController: serverController,
                          codeController: codeController,
                        );
                      case ConnectOrgStep.confirm:
                        return _ConfirmPane(provider: provider);
                      case ConnectOrgStep.registering:
                      case ConnectOrgStep.registeringDevice:
                        // Path A (synced passkey) hits registering/-Device
                        // without an invitation resolved. Fall back to a
                        // bare progress pane in that case; the invitation
                        // flow keeps the confirm chrome for continuity.
                        final hasInvitation = ref.watch(
                          provider.select((s) => s.invitation != null),
                        );
                        if (hasInvitation) {
                          return _ConfirmPane(provider: provider);
                        }
                        return _ProgressPane(provider: provider);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InputPane extends ConsumerWidget {
  const _InputPane({
    required this.provider,
    required this.serverController,
    required this.codeController,
  });

  final ConnectOrgViewModelProvider provider;
  final TextEditingController serverController;
  final TextEditingController codeController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _FieldLabel(text: l10n.connectOrgServerUrlLabel),
        const SizedBox(height: AppSpacing.xs),
        _MonoInput(
          controller: serverController,
          hint: l10n.connectOrgServerUrlHint,
          onChanged: (v) => ref.read(provider.notifier).onServerUrlChanged(v),
        ),
        const SizedBox(height: AppSpacing.md),
        _FieldLabel(text: l10n.connectOrgInvitationCodeLabel),
        const SizedBox(height: AppSpacing.xs),
        _MonoInput(
          controller: codeController,
          hint: l10n.connectOrgInvitationCodeHint,
          textCapitalization: TextCapitalization.characters,
          onChanged: (v) =>
              ref.read(provider.notifier).onInvitationCodeChanged(v),
        ),
        const Spacer(),
        Consumer(
          builder: (context, ref, _) {
            final isBusy = ref.watch(provider.select((s) => s.isBusy));
            return FilledButton(
              onPressed: isBusy
                  ? null
                  : () => ref.read(provider.notifier).onContinueTapped(),
              child: isBusy
                  ? const _ButtonSpinner()
                  : Text(l10n.connectOrgLookup),
            );
          },
        ),
        const SizedBox(height: AppSpacing.sm),
        Consumer(
          builder: (context, ref, _) {
            final isBusy = ref.watch(provider.select((s) => s.isBusy));
            return OutlinedButton(
              onPressed: isBusy
                  ? null
                  : () => ref
                        .read(provider.notifier)
                        .onUseExistingPasskeyTapped(),
              child: Text(l10n.connectOrgUseExistingPasskey),
            );
          },
        ),
      ],
    );
  }
}

class _ProgressPane extends ConsumerWidget {
  const _ProgressPane({required this.provider});

  final ConnectOrgViewModelProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final step = ref.watch(provider.select((s) => s.step));
    final label = step == ConnectOrgStep.registeringDevice
        ? l10n.connectOrgFinishing
        : l10n.connectOrgAssertionProgress;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: AppSpacing.md),
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}

class _ConfirmPane extends ConsumerWidget {
  const _ConfirmPane({required this.provider});

  final ConnectOrgViewModelProvider provider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    final invitation = state.invitation;
    if (invitation == null) return const SizedBox.shrink();
    final theme = Theme.of(context);
    final colors = context.harkColors;
    final l10n = AppLocalizations.of(context);
    final isBusy = state.isBusy;

    final progressLabel = switch (state.step) {
      ConnectOrgStep.registering => l10n.activeAlertActionSending,
      ConnectOrgStep.registeringDevice => l10n.connectOrgFinishing,
      _ => null,
    };

    final isAddDevice = invitation.kind == 'add_device';
    final title = isAddDevice
        ? l10n.connectOrgConfirmTitleAddDevice(invitation.orgName)
        : l10n.connectOrgConfirmTitle(invitation.orgName);
    final body = isAddDevice
        ? l10n.connectOrgConfirmBodyAddDevice(invitation.orgName)
        : l10n.connectOrgConfirmBody(invitation.orgName);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: theme.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          body,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainer,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colors.borderSubtle),
          ),
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _KeyValue(
                label: l10n.connectOrgServerUrlLabel,
                value: state.serverUrl,
              ),
              const SizedBox(height: AppSpacing.sm),
              _KeyValue(
                label: l10n.connectOrgInvitationCodeLabel,
                value: state.invitationCode,
              ),
            ],
          ),
        ),
        const Spacer(),
        if (progressLabel != null) ...[
          Center(
            child: Text(
              progressLabel,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
        FilledButton(
          onPressed: isBusy
              ? null
              : () => ref.read(provider.notifier).onCreatePasskeyTapped(),
          child: isBusy
              ? const _ButtonSpinner()
              : Text(l10n.connectOrgConfirmCta),
        ),
        const SizedBox(height: AppSpacing.sm),
        OutlinedButton(
          onPressed: isBusy
              ? null
              : () => ref.read(provider.notifier).onBackToInputTapped(),
          child: Text(l10n.connectOrgConfirmCancel),
        ),
      ],
    );
  }
}

class _KeyValue extends StatelessWidget {
  const _KeyValue({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          value,
          style: AppTheme.monoStyle(
            theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.6),
      ),
    );
  }
}

class _MonoInput extends StatelessWidget {
  const _MonoInput({
    required this.controller,
    required this.hint,
    required this.onChanged,
    this.textCapitalization = TextCapitalization.none,
  });

  final TextEditingController controller;
  final String hint;
  final ValueChanged<String> onChanged;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = context.harkColors;
    return TextField(
      controller: controller,
      onChanged: onChanged,
      textCapitalization: textCapitalization,
      style: AppTheme.monoStyle(
        theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
        ),
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTheme.monoStyle(
          theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface.withValues(alpha: 0.3),
          ),
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

class _ButtonSpinner extends StatelessWidget {
  const _ButtonSpinner();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
