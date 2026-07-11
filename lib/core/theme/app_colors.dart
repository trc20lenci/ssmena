import 'package:flutter/material.dart';

/// Color tokens. SMENA_DESIGN_SYSTEM §2 / SMENA_BRAND_BOOK §7.
/// Strictly monochromatic dark base plus a single accent — do not add
/// additional accent hues without an approved design-system change.
class AppColors {
  AppColors._();

  // Primary
  static const Color primary = Color(0xFF7C5CFC);
  static const Color primaryHover = Color(0xFF6A48E8);
  static const Color primarySubtle = Color(0x1F7C5CFC); // 12% opacity

  // Backgrounds (depth system)
  static const Color bgBase = Color(0xFF0A0A0F);
  static const Color bgElevated = Color(0xFF141419);
  static const Color bgOverlay = Color(0xFF1C1C24);
  static const Color bgGlass = Color(0x0AFFFFFF); // 4% white

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8E8EA0);
  static const Color textTertiary = Color(0xFF5A5A6E);
  static const Color textInverse = Color(0xFF0A0A0F);

  // Semantic
  static const Color success = Color(0xFF34D399);
  static const Color warning = Color(0xFFFBBF24);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF60A5FA);

  // Borders
  static const Color borderSubtle = Color(0x0FFFFFFF); // 6% white
  static const Color borderStrong = Color(0x1FFFFFFF); // 12% white
  static const Color borderGlass = Color(0x14FFFFFF); // 8% white
}
