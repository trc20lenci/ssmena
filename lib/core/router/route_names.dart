/// Path constants for GoRouter. Centralized so features never
/// hardcode route strings (SMENA_CODING_GUIDE §10).
/// Mirrors the navigation structure in SMENA_MASTER_CONTEXT §7/§10.
/// Feature screens are wired in as each module is implemented — this
/// foundation only defines the skeleton.
class RouteNames {
  RouteNames._();

  static const String splash = '/';
  static const String onboarding = '/onboarding';

  static const String authPhone = '/auth/phone';
  static const String authOtp = '/auth/otp';
  static const String authRole = '/auth/role';

  static const String setupWorker = '/setup/worker';
  static const String setupEmployer = '/setup/employer';
  static const String setupPayment = '/setup/payment';

  // Worker shell (bottom nav)
  static const String workerHome = '/jobs';
  static const String workerMyJobs = '/my-jobs';
  static const String workerEarnings = '/earnings';
  static const String workerProfile = '/profile';

  // Employer shell (bottom nav)
  static const String employerDashboard = '/dashboard';
  static const String employerMyJobs = '/employer/my-jobs';
  static const String employerPayments = '/payments';
  static const String employerProfile = '/employer/profile';
}
