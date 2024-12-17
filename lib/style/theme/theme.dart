import "package:eateries/style/typography/common_text_styles.dart";
import "package:flutter/material.dart";

class MaterialTheme {
  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF4CAF50),
      surfaceTint: Color(0xFF4CAF50),
      onPrimary: Color(0xFFFFFFFF),
      primaryContainer: Color(0xFFA5D6A7),
      onPrimaryContainer: Color(0xFF1B5E20),
      secondary: Color(0xFF8BC34A),
      onSecondary: Color(0xFFFFFFFF),
      secondaryContainer: Color(0xFFC5E1A5),
      onSecondaryContainer: Color(0xFF33691E),
      tertiary: Color(0xFF00BCD4),
      onTertiary: Color(0xFFFFFFFF),
      tertiaryContainer: Color(0xFFB2EBF2),
      onTertiaryContainer: Color(0xFF006064),
      error: Color(0xFFF44336),
      onError: Color(0xFFFFFFFF),
      errorContainer: Color(0xFFE57373),
      onErrorContainer: Color(0xFFB71C1C),
      surface: Color(0xFFFFFFFF),
      onSurface: Color(0xFF212121),
      onSurfaceVariant: Color(0xFF757575),
      outline: Color(0xFFBDBDBD),
      outlineVariant: Color(0xFFE0E0E0),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFF424242),
      inversePrimary: Color(0xFF81C784),
      primaryFixed: Color(0xFFA5D6A7),
      onPrimaryFixed: Color(0xFF1B5E20),
      primaryFixedDim: Color(0xFF81C784),
      onPrimaryFixedVariant: Color(0xFF388E3C),
      secondaryFixed: Color(0xFFC5E1A5),
      onSecondaryFixed: Color(0xFF33691E),
      secondaryFixedDim: Color(0xFF9CCC65),
      onSecondaryFixedVariant: Color(0xFF689F38),
      tertiaryFixed: Color(0xFFB2EBF2),
      onTertiaryFixed: Color(0xFF006064),
      tertiaryFixedDim: Color(0xFF80DEEA),
      onTertiaryFixedVariant: Color(0xFF0097A7),
      surfaceDim: Color(0xFFFAFAFA),
      surfaceBright: Color(0xFFFFFFFF),
      surfaceContainerLowest: Color(0xFFFFFFFF),
      surfaceContainerLow: Color(0xFFF5F5F5),
      surfaceContainer: Color(0xFFEEEEEE),
      surfaceContainerHigh: Color(0xFFE0E0E0),
      surfaceContainerHighest: Color(0xFFBDBDBD),
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: CommonTextStyles.displayLarge,
      displayMedium: CommonTextStyles.displayMedium,
      displaySmall: CommonTextStyles.displaySmall,
      headlineLarge: CommonTextStyles.headlineLarge,
      headlineMedium: CommonTextStyles.headlineMedium,
      headlineSmall: CommonTextStyles.headlineSmall,
      titleLarge: CommonTextStyles.titleLarge,
      titleMedium: CommonTextStyles.titleMedium,
      titleSmall: CommonTextStyles.titleSmall,
      bodyLarge: CommonTextStyles.bodyLargeBold,
      bodyMedium: CommonTextStyles.bodyLargeMedium,
      bodySmall: CommonTextStyles.bodyLargeRegular,
      labelLarge: CommonTextStyles.labelLarge,
      labelMedium: CommonTextStyles.labelMedium,
      labelSmall: CommonTextStyles.labelSmall,
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFF81C784),
      surfaceTint: Color(0xFF81C784),
      onPrimary: Color(0xFF1B5E20),
      primaryContainer: Color(0xFF388E3C),
      onPrimaryContainer: Color(0xFFA5D6A7),
      secondary: Color(0xFF9CCC65),
      onSecondary: Color(0xFF33691E),
      secondaryContainer: Color(0xFF689F38),
      onSecondaryContainer: Color(0xFFC5E1A5),
      tertiary: Color(0xFF80DEEA),
      onTertiary: Color(0xFF006064),
      tertiaryContainer: Color(0xFF0097A7),
      onTertiaryContainer: Color(0xFFB2EBF2),
      error: Color(0xFFD32F2F),
      onError: Color(0xFFB71C1C),
      errorContainer: Color(0xFFEF9A9A),
      onErrorContainer: Color(0xFFFFEBEE),
      surface: Color(0xFF212121),
      onSurface: Color(0xFFE0E0E0),
      onSurfaceVariant: Color(0xFFBDBDBD),
      outline: Color(0xFF9E9E9E),
      outlineVariant: Color(0xFF616161),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFF5F5F5),
      inversePrimary: Color(0xFF4CAF50),
      primaryFixed: Color(0xFFA5D6A7),
      onPrimaryFixed: Color(0xFF1B5E20),
      primaryFixedDim: Color(0xFF81C784),
      onPrimaryFixedVariant: Color(0xFF388E3C),
      secondaryFixed: Color(0xFFC5E1A5),
      onSecondaryFixed: Color(0xFF33691E),
      secondaryFixedDim: Color(0xFF9CCC65),
      onSecondaryFixedVariant: Color(0xFF689F38),
      tertiaryFixed: Color(0xFFB2EBF2),
      onTertiaryFixed: Color(0xFF006064),
      tertiaryFixedDim: Color(0xFF80DEEA),
      onTertiaryFixedVariant: Color(0xFF0097A7),
      surfaceDim: Color(0xFF424242),
      surfaceBright: Color(0xFF616161),
      surfaceContainerLowest: Color(0xFF212121),
      surfaceContainerLow: Color(0xFF323232),
      surfaceContainer: Color(0xFF424242),
      surfaceContainerHigh: Color(0xFF616161),
      surfaceContainerHighest: Color(0xFF757575),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
    );
  }
}
