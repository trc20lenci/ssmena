/// Motion durations. SMENA_DESIGN_SYSTEM §11.
/// Motion should feel fast and physical — do not introduce longer
/// "floaty" durations than these without a design-system change.
class AppDuration {
  AppDuration._();

  static const Duration micro = Duration(milliseconds: 100); // taps
  static const Duration standard = Duration(milliseconds: 200); // modals, toggles
  static const Duration entrance = Duration(milliseconds: 300); // cards, sheets
  static const Duration exit = Duration(milliseconds: 200);
  static const Duration complex = Duration(milliseconds: 400); // page transitions
}
