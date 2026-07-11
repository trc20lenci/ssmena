import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radius.dart';

/// "Liquid Glass" is a premium material reserved for a fixed set of
/// surfaces — SMENA_DESIGN_SYSTEM §6 / SMENA_AI_RULES:
///   1. Bottom navigation bar
///   2. Search bar (floating over the scrolling feed)
///   3. Floating action buttons
///   4. Filter modal backdrop
///   5. Profile cards on Job Detail screens
///
/// Do NOT use this on job cards, notification rows, settings rows, or
/// standard inputs — those always use solid [AppColors.bgElevated].
/// Before using [wrap]/[decoration] anywhere new, check that surface
/// is on the list above.
class GlassTheme {
  GlassTheme._();

  static const double blurSigma = 24;

  static BoxDecoration decoration({double radius = AppRadius.md}) {
    return BoxDecoration(
      color: AppColors.bgGlass,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: AppColors.borderGlass, width: 1),
    );
  }

  static Widget wrap({required Widget child, double radius = AppRadius.md}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(decoration: decoration(radius: radius), child: child),
      ),
    );
  }
}
