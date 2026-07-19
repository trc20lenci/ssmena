import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Type scale — v2.
/// Primary face: Inter (UI text, labels, body).
/// Secondary face: Manrope (large numeric displays — pay amounts,
/// wallet balance — where a slightly warmer geometric numeral reads
/// better at big sizes than Inter's).
///
/// NOTE: uses google_fonts to fetch at runtime for now; bundle both
/// as local assets before release.
class AppTextStyles {
  AppTextStyles._();

  static TextStyle get _inter => GoogleFonts.inter(color: AppColors.textPrimary);
  static TextStyle get _manrope => GoogleFonts.manrope(color: AppColors.textPrimary);

  /// Wallet balance.
  static TextStyle displayLg = _manrope.copyWith(
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.1,
    letterSpacing: -0.02 * 40,
  );

  /// Task/job payout amount — must visually dominate its card/screen.
  static TextStyle displayMd = _manrope.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.015 * 32,
  );

  static TextStyle heading1 = _inter.copyWith(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: -0.01 * 24,
  );

  static TextStyle heading2 = _inter.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.3,
    letterSpacing: -0.01 * 20,
  );

  static TextStyle heading3 = _inter.copyWith(fontSize: 18, fontWeight: FontWeight.w500, height: 1.4);

  static TextStyle bodyLg = _inter.copyWith(fontSize: 16, fontWeight: FontWeight.w400, height: 1.5);
  static TextStyle bodyMd = _inter.copyWith(fontSize: 15, fontWeight: FontWeight.w400, height: 1.5);

  static TextStyle bodySm = _inter.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColors.textSecondary,
  );

  static TextStyle caption = _inter.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.04 * 12,
    color: AppColors.textSecondary,
  );

  static TextStyle label = _inter.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    height: 1.3,
    letterSpacing: 0.06 * 11,
  );
}
