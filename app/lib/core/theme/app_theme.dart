import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color_scheme_extension.dart';

abstract final class AppTheme {
  static ThemeData get dark {
    const surface = Color(0xFF0A0A0B);
    const surfaceContainer = Color(0xFF151517);
    const surfaceContainerHigh = Color(0xFF17171A);
    const outline = Color(0xFF232326);

    final textTheme = _textTheme().apply(
      bodyColor: const Color(0xFFF4F4F5),
      displayColor: const Color(0xFFF4F4F5),
    );

    final base = ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: surface,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFFE84A5F),
        onPrimary: Colors.white,
        secondary: Color(0xFFE0B950),
        onSecondary: Color(0xFF241A04),
        error: Color(0xFFE84A5F),
        onError: Colors.white,
        surface: surface,
        onSurface: Color(0xFFF4F4F5),
        onSurfaceVariant: Color(0xFFE4E4E7),
        surfaceContainer: surfaceContainer,
        surfaceContainerHigh: surfaceContainerHigh,
        outline: outline,
        outlineVariant: Color(0xFF1C1C1F),
      ),
      textTheme: textTheme,
    );

    return base.copyWith(extensions: const [AppColorSchemeExtension.dark]);
  }

  /// Returns a Roboto Mono variant of [base], for monospaced display of codes
  /// and timestamps. Call with a theme text style to inherit size and color.
  static TextStyle monoStyle(TextStyle? base) =>
      GoogleFonts.robotoMono(textStyle: base ?? const TextStyle());

  static TextTheme _textTheme() {
    return TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 57,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 45,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 36,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w700,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w800,
      ),
      titleLarge: GoogleFonts.inter(fontSize: 22, fontWeight: FontWeight.w700),
      titleMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w700),
      titleSmall: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
      bodyLarge: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400),
      bodySmall: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400),
      labelLarge: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
      labelMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.06,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.02,
      ),
    );
  }
}
