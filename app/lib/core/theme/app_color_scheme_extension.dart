import 'package:flutter/material.dart';

/// Colors that aren't a natural fit for [ColorScheme]:
/// the OKLCH accents from `.tmp/web/project/_ds/tokens/colors.css`.
@immutable
class AppColorSchemeExtension extends ThemeExtension<AppColorSchemeExtension> {
  const AppColorSchemeExtension({
    required this.critical,
    required this.criticalStrong,
    required this.criticalBackground,
    required this.criticalBorder,
    required this.criticalTextMuted,
    required this.criticalTextDim,
    required this.warning,
    required this.ackText,
    required this.ackBackground,
    required this.ackBorder,
    required this.declineText,
    required this.declineBackground,
    required this.resolvedText,
    required this.resolvedBackground,
    required this.resolvedBorder,
    required this.surfaceInput,
    required this.borderSubtle,
    required this.borderHairline,
  });

  final Color critical; // brand red — used for CRITICAL badge + Ack button
  final Color criticalStrong; // hover/active
  final Color criticalBackground; // critical screen bg
  final Color criticalBorder;
  final Color criticalTextMuted;
  final Color criticalTextDim;
  final Color warning; // amber
  final Color ackText;
  final Color ackBackground;
  final Color ackBorder;
  final Color declineText;
  final Color declineBackground;
  final Color resolvedText;
  final Color resolvedBackground;
  final Color resolvedBorder;
  final Color surfaceInput;
  final Color borderSubtle;
  final Color borderHairline;

  static const AppColorSchemeExtension dark = AppColorSchemeExtension(
    critical: Color(0xFFE84A5F), // oklch(63% 0.21 25) approximation
    criticalStrong: Color(0xFFEE6577),
    criticalBackground: Color(0xFF160B0B),
    criticalBorder: Color(0xFF3A1C1C),
    criticalTextMuted: Color(0xFFC8898A),
    criticalTextDim: Color(0xFFA97879),
    warning: Color(0xFFE0B950), // amber-8
    ackText: Color(0xFF7FD996),
    ackBackground: Color(0xFF152A1A),
    ackBorder: Color(0xFF1E4028),
    declineText: Color(0xFFE0838A),
    declineBackground: Color(0xFF2A1516),
    resolvedText: Color(0xFF8AB6E0),
    resolvedBackground: Color(0x1F5799DE),
    resolvedBorder: Color(0x595799DE),
    surfaceInput: Color(0xFF17171A),
    borderSubtle: Color(0xFF232326),
    borderHairline: Color(0xFF1C1C1F),
  );

  @override
  AppColorSchemeExtension copyWith({
    Color? critical,
    Color? criticalStrong,
    Color? criticalBackground,
    Color? criticalBorder,
    Color? criticalTextMuted,
    Color? criticalTextDim,
    Color? warning,
    Color? ackText,
    Color? ackBackground,
    Color? ackBorder,
    Color? declineText,
    Color? declineBackground,
    Color? resolvedText,
    Color? resolvedBackground,
    Color? resolvedBorder,
    Color? surfaceInput,
    Color? borderSubtle,
    Color? borderHairline,
  }) {
    return AppColorSchemeExtension(
      critical: critical ?? this.critical,
      criticalStrong: criticalStrong ?? this.criticalStrong,
      criticalBackground: criticalBackground ?? this.criticalBackground,
      criticalBorder: criticalBorder ?? this.criticalBorder,
      criticalTextMuted: criticalTextMuted ?? this.criticalTextMuted,
      criticalTextDim: criticalTextDim ?? this.criticalTextDim,
      warning: warning ?? this.warning,
      ackText: ackText ?? this.ackText,
      ackBackground: ackBackground ?? this.ackBackground,
      ackBorder: ackBorder ?? this.ackBorder,
      declineText: declineText ?? this.declineText,
      declineBackground: declineBackground ?? this.declineBackground,
      resolvedText: resolvedText ?? this.resolvedText,
      resolvedBackground: resolvedBackground ?? this.resolvedBackground,
      resolvedBorder: resolvedBorder ?? this.resolvedBorder,
      surfaceInput: surfaceInput ?? this.surfaceInput,
      borderSubtle: borderSubtle ?? this.borderSubtle,
      borderHairline: borderHairline ?? this.borderHairline,
    );
  }

  @override
  AppColorSchemeExtension lerp(AppColorSchemeExtension? other, double t) {
    if (other == null) return this;
    return AppColorSchemeExtension(
      critical: Color.lerp(critical, other.critical, t) ?? critical,
      criticalStrong:
          Color.lerp(criticalStrong, other.criticalStrong, t) ?? criticalStrong,
      criticalBackground:
          Color.lerp(criticalBackground, other.criticalBackground, t) ??
          criticalBackground,
      criticalBorder:
          Color.lerp(criticalBorder, other.criticalBorder, t) ?? criticalBorder,
      criticalTextMuted:
          Color.lerp(criticalTextMuted, other.criticalTextMuted, t) ??
          criticalTextMuted,
      criticalTextDim:
          Color.lerp(criticalTextDim, other.criticalTextDim, t) ??
          criticalTextDim,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      ackText: Color.lerp(ackText, other.ackText, t) ?? ackText,
      ackBackground:
          Color.lerp(ackBackground, other.ackBackground, t) ?? ackBackground,
      ackBorder: Color.lerp(ackBorder, other.ackBorder, t) ?? ackBorder,
      declineText: Color.lerp(declineText, other.declineText, t) ?? declineText,
      declineBackground:
          Color.lerp(declineBackground, other.declineBackground, t) ??
          declineBackground,
      resolvedText:
          Color.lerp(resolvedText, other.resolvedText, t) ?? resolvedText,
      resolvedBackground:
          Color.lerp(resolvedBackground, other.resolvedBackground, t) ??
          resolvedBackground,
      resolvedBorder:
          Color.lerp(resolvedBorder, other.resolvedBorder, t) ?? resolvedBorder,
      surfaceInput:
          Color.lerp(surfaceInput, other.surfaceInput, t) ?? surfaceInput,
      borderSubtle:
          Color.lerp(borderSubtle, other.borderSubtle, t) ?? borderSubtle,
      borderHairline:
          Color.lerp(borderHairline, other.borderHairline, t) ?? borderHairline,
    );
  }
}

extension AppColorSchemeExtensionX on BuildContext {
  AppColorSchemeExtension get harkColors =>
      Theme.of(this).extension<AppColorSchemeExtension>()!;
}
