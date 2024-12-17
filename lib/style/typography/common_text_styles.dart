import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonTextStyles {
  // Base styles for each font
  static final TextStyle _figtreeStyle = GoogleFonts.figtree();
  static final TextStyle _interStyle = GoogleFonts.inter();

  /// displayLarge Text Style
  static final TextStyle displayLarge = _figtreeStyle.copyWith(
    fontSize: 57,
    fontWeight: FontWeight.w700,
    height: 1.11,
    letterSpacing: -2,
  );

  /// displayMedium Text Style
  static final TextStyle displayMedium = _figtreeStyle.copyWith(
    fontSize: 45,
    fontWeight: FontWeight.w600,
    height: 1.17,
    letterSpacing: -1,
  );

  /// displaySmall Text Style
  static final TextStyle displaySmall = _figtreeStyle.copyWith(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    height: 1.25,
    letterSpacing: -1,
  );

  /// headlineLarge Text Style
  static final TextStyle headlineLarge = _figtreeStyle.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    height: 1.5,
    letterSpacing: -1,
  );

  /// headlineMedium Text Style
  static final TextStyle headlineMedium = _figtreeStyle.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: -1,
  );

  /// headlineSmall Text Style
  static final TextStyle headlineSmall = _figtreeStyle.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    height: 1.0,
    letterSpacing: 2,
  );

  /// titleLarge Text Style
  static final TextStyle titleLarge = _figtreeStyle.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    height: 1.2,
    letterSpacing: 1.2,
  );

  /// titleMedium Text Style
  static final TextStyle titleMedium = _figtreeStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.2,
    letterSpacing: 1.2,
  );

  /// titleSmall Text Style
  static final TextStyle titleSmall = _figtreeStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.2,
    letterSpacing: 1.2,
  );

  /// bodyLargeBold Text Style
  static final TextStyle bodyLargeBold = _interStyle.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.56,
  );

  /// bodyLargeMedium Text Style
  static final TextStyle bodyLargeMedium = _interStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.56,
  );

  /// bodyLargeRegular Text Style
  static final TextStyle bodyLargeRegular = _interStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    height: 1.56,
  );

  /// labelLarge Text Style
  static final TextStyle labelLarge = _interStyle.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    height: 1.71,
    letterSpacing: 1.3,
  );

  /// labelMedium Text Style
  static final TextStyle labelMedium = _interStyle.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w200,
    height: 1.4,
    letterSpacing: 1.3,
  );

  /// labelSmall Text Style
  static final TextStyle labelSmall = _interStyle.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w100,
    height: 1.2,
    letterSpacing: 1.3,
  );
}
