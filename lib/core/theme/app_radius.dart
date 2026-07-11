/// Border radius scale. SMENA_DESIGN_SYSTEM §4.
/// Kept tight and architectural — never exceed [xl] for primary UI
/// elements (no "bubble" aesthetic, per SMENA_AI_RULES Design Rules).
class AppRadius {
  AppRadius._();

  static const double none = 0;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double pill = 999;
}
