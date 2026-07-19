/// Path constants for GoRouter. Centralized so features never
/// hardcode route strings. Mirrors the phase-2 screen inventory
/// (SMENA_UI_FOUNDATION_BRIEF). Screens are wired in feature-by-feature
/// — see IMPLEMENTATION_PLAN for build order. Everything not yet built
/// still routes, to a styled placeholder, so the app stays runnable.
class RouteNames {
  RouteNames._();

  // ---- Auth flow (built) ----
  static const String splash = '/';
  static const String onboarding = '/onboarding';
  static const String welcome = '/welcome';
  static const String authPhone = '/auth/phone';
  static const String authOtp = '/auth/otp';
  static const String authRole = '/auth/role';
  static const String accountCreation = '/auth/account';
  static const String permissions = '/auth/permissions';
  static const String permissionLocation = '/auth/permissions/location';
  static const String permissionNotification = '/auth/permissions/notifications';
  static const String identityIntro = '/auth/identity-intro';
  static const String authSuccess = '/auth/success';

  // ---- Worker shell (placeholder) ----
  static const String workerHome = '/jobs';
  static const String workerSearch = '/jobs/search';
  static const String workerMyJobs = '/my-jobs';
  static const String workerWallet = '/wallet';
  static const String workerMessages = '/messages';
  static const String workerProfile = '/profile';

  // ---- Employer shell (placeholder) ----
  static const String employerDashboard = '/dashboard';
  static const String employerTasks = '/employer/tasks';
  static const String employerApplicants = '/employer/applicants';
  static const String employerMessages = '/employer/messages';
  static const String employerProfile = '/employer/profile';

  // ---- Misc (placeholder) ----
  static const String settings = '/settings';
  static const String notifications = '/notifications';
}
