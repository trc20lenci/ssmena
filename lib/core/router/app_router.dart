import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screens/account_creation_screen.dart';
import '../../features/auth/presentation/screens/identity_verification_intro_screen.dart';
import '../../features/auth/presentation/screens/location_permission_screen.dart';
import '../../features/auth/presentation/screens/notification_permission_screen.dart';
import '../../features/auth/presentation/screens/onboarding_screen.dart';
import '../../features/auth/presentation/screens/otp_verification_screen.dart';
import '../../features/auth/presentation/screens/permissions_screen.dart';
import '../../features/auth/presentation/screens/phone_login_screen.dart';
import '../../features/auth/presentation/screens/role_selection_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/success_screen.dart';
import '../../features/auth/presentation/screens/welcome_screen.dart';
import 'route_guards.dart';
import 'route_names.dart';

/// Used only for flows not yet built (worker/employer shells, settings,
/// etc.) so the app stays fully navigable while those are built out in
/// later batches. Styled with the real theme, so it doesn't look broken
/// mid-build — just clearly "coming next".
class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(label, style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteNames.splash,
    debugLogDiagnostics: true,
    redirect: routeGuard,
    routes: [
      // ---- Auth flow (real screens) ----
      GoRoute(path: RouteNames.splash, builder: (c, s) => const SplashScreen()),
      GoRoute(path: RouteNames.onboarding, builder: (c, s) => const OnboardingScreen()),
      GoRoute(path: RouteNames.welcome, builder: (c, s) => const WelcomeScreen()),
      GoRoute(path: RouteNames.authPhone, builder: (c, s) => const PhoneLoginScreen()),
      GoRoute(path: RouteNames.authOtp, builder: (c, s) => const OtpVerificationScreen()),
      GoRoute(path: RouteNames.authRole, builder: (c, s) => const RoleSelectionScreen()),
      GoRoute(path: RouteNames.accountCreation, builder: (c, s) => const AccountCreationScreen()),
      GoRoute(path: RouteNames.permissions, builder: (c, s) => const PermissionsScreen()),
      GoRoute(path: RouteNames.permissionLocation, builder: (c, s) => const LocationPermissionScreen()),
      GoRoute(
        path: RouteNames.permissionNotification,
        builder: (c, s) => const NotificationPermissionScreen(),
      ),
      GoRoute(path: RouteNames.identityIntro, builder: (c, s) => const IdentityVerificationIntroScreen()),
      GoRoute(path: RouteNames.authSuccess, builder: (c, s) => const SuccessScreen()),

      // ---- Worker shell (placeholder — next batch) ----
      GoRoute(path: RouteNames.workerHome, builder: (c, s) => const _PlaceholderScreen('Task Feed')),
      GoRoute(path: RouteNames.workerSearch, builder: (c, s) => const _PlaceholderScreen('Search')),
      GoRoute(path: RouteNames.workerMyJobs, builder: (c, s) => const _PlaceholderScreen('My Jobs')),
      GoRoute(path: RouteNames.workerWallet, builder: (c, s) => const _PlaceholderScreen('Wallet')),
      GoRoute(path: RouteNames.workerMessages, builder: (c, s) => const _PlaceholderScreen('Messages')),
      GoRoute(path: RouteNames.workerProfile, builder: (c, s) => const _PlaceholderScreen('Profile')),

      // ---- Employer shell (placeholder — next batch) ----
      GoRoute(
        path: RouteNames.employerDashboard,
        builder: (c, s) => const _PlaceholderScreen('Employer Dashboard'),
      ),
      GoRoute(path: RouteNames.employerTasks, builder: (c, s) => const _PlaceholderScreen('Employer Tasks')),
      GoRoute(
        path: RouteNames.employerApplicants,
        builder: (c, s) => const _PlaceholderScreen('Applicants'),
      ),
      GoRoute(
        path: RouteNames.employerMessages,
        builder: (c, s) => const _PlaceholderScreen('Employer Messages'),
      ),
      GoRoute(
        path: RouteNames.employerProfile,
        builder: (c, s) => const _PlaceholderScreen('Employer Profile'),
      ),

      // ---- Misc (placeholder) ----
      GoRoute(path: RouteNames.settings, builder: (c, s) => const _PlaceholderScreen('Settings')),
      GoRoute(
        path: RouteNames.notifications,
        builder: (c, s) => const _PlaceholderScreen('Notifications'),
      ),
    ],
    errorBuilder: (context, state) => const _PlaceholderScreen('404 — Not Found'),
  );
});
