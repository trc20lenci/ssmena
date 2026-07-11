import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Type scale. SMENA_DESIGN_SYSTEM §1.
/// Font is Inter — never substitute (SMENA_AI_RULES Design Rules).
///
/// NOTE: uses google_fonts to fetch Inter at runtime for now. Before
/// release, bundle Inter as local .ttf assets instead so the app
/// doesn't depend on a network font fetch on first launch.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle get _base => GoogleFonts.inter(color: AppColors.textPrimary);

  /// Wallet balance — the largest element in the app (Design System "Money is King").
  static TextStyle displayLg = _base.copyWith(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.1,
    letterSpacing: -0.02 * 40,
  );

  /// Job pay amount on Job Details — must visually dominate the title.
  static TextStyle displayMd = _base.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.015 * 32,
  );

  static TextStyle heading1 = _base.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: -0.01 * 24,
  );

  static TextStyle heading2 = _base.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: -0.01 * 20,
  );

  static TextStyle heading3 = _base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static TextStyle bodyLg = _base.copyWith(fontSize: 16, fontWeight: FontWeight.w400, height: 1.5);

  static TextStyle bodyMd = _base.copyWith(fontSize: 15, fontWeight: FontWeight.w400, height: 1.5);

  static TextStyle bodySm = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static TextStyle caption = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.04 * 12,
    color: AppColors.textSecondary,
  );

  static TextStyle label = _base.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0.06 * 11,
  );
}
