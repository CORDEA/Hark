import 'package:flutter/material.dart';

import 'app_color_scheme_extension.dart';

abstract final class AppTheme {
  static ThemeData get dark {
    const surface = Color(0xFF0A0A0B);
    const surfaceContainer = Color(0xFF151517);
    const surfaceContainerHigh = Color(0xFF17171A);
    const outline = Color(0xFF232326);

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
        surfaceContainer: surfaceContainer,
        surfaceContainerHigh: surfaceContainerHigh,
        outline: outline,
        outlineVariant: Color(0xFF1C1C1F),
      ),
      fontFamily: 'SF Pro Text',
    );

    return base.copyWith(
      extensions: const [AppColorSchemeExtension.dark],
      textTheme: base.textTheme.apply(
        bodyColor: const Color(0xFFF4F4F5),
        displayColor: const Color(0xFFF4F4F5),
      ),
    );
  }
}
