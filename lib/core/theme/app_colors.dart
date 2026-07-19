import 'package:flutter/material.dart';

/// Color tokens — v2 ("industrial monochrome") palette.
///
/// This REPLACES the original indigo/glass palette. Per product
/// decision: no purple/violet/indigo, no gradients, no glassmorphism.
/// 90% of the UI is black/white/gray; the accent blue is used ONLY for
/// active states, selected tabs, primary actions, and links — never as
/// a background fill or decorative element.
class AppColors {
  AppColors._();

  // Backgrounds (depth via near-black steps, no glass/blur)
  static const Color bgBase = Color(0xFF050505);
  static const Color bgSurface = Color(0xFF0F0F0F);
  static const Color bgCard = Color(0xFF161616);

  // Borders
  static const Color border = Color(0xFF242424);

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFB3B3B3);
  static const Color textMuted = Color(0xFF808080);
  static const Color textInverse = Color(0xFF050505);

  // Accent — use sparingly: active states, selected tabs, primary CTA, links.
  // Never as a background fill or decorative gradient.
  static const Color accent = Color(0xFF2F6FDB);
  static const Color accentPressed = Color(0xFF2559B0);
  static const Color accentSubtle = Color(0x1F2F6FDB); // 12% — selected-chip fill only

  // Semantic
  static const Color success = Color(0xFF2FBF71);
  static const Color danger = Color(0xFFFF5A5F);
  static const Color warning = Color(0xFFE0A22B);
}
