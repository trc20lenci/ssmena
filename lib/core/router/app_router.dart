import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'route_guards.dart';
import 'route_names.dart';

/// Temporary placeholder used until real feature screens land. Every
/// route below points here for now so the routing skeleton is
/// runnable end-to-end. Replace each builder as its feature module
/// is implemented (see IMPLEMENTATION_PLAN — development order).
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
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const _PlaceholderScreen('Splash'),
      ),
      GoRoute(
        path: RouteNames.onboarding,
        builder: (context, state) => const _PlaceholderScreen('Onboarding'),
      ),
      GoRoute(
        path: RouteNames.authPhone,
        builder: (context, state) => const _PlaceholderScreen('Phone Entry'),
      ),
      GoRoute(
        path: RouteNames.authOtp,
        builder: (context, state) => const _PlaceholderScreen('OTP Verification'),
      ),
      GoRoute(
        path: RouteNames.authRole,
        builder: (context, state) => const _PlaceholderScreen('Role Selection'),
      ),
      GoRoute(
        path: RouteNames.setupWorker,
        builder: (context, state) => const _PlaceholderScreen('Worker Setup'),
      ),
      GoRoute(
        path: RouteNames.setupEmployer,
        builder: (context, state) => const _PlaceholderScreen('Employer Setup'),
      ),
      GoRoute(
        path: RouteNames.setupPayment,
        builder: (context, state) => const _PlaceholderScreen('Payment Setup'),
      ),
      GoRoute(
        path: RouteNames.workerHome,
        builder: (context, state) => const _PlaceholderScreen('Job Feed'),
      ),
      GoRoute(
        path: RouteNames.workerMyJobs,
        builder: (context, state) => const _PlaceholderScreen('My Jobs'),
      ),
      GoRoute(
        path: RouteNames.workerEarnings,
        builder: (context, state) => const _PlaceholderScreen('Earnings'),
      ),
      GoRoute(
        path: RouteNames.workerProfile,
        builder: (context, state) => const _PlaceholderScreen('Worker Profile'),
      ),
      GoRoute(
        path: RouteNames.employerDashboard,
        builder: (context, state) => const _PlaceholderScreen('Employer Dashboard'),
      ),
      GoRoute(
        path: RouteNames.employerMyJobs,
        builder: (context, state) => const _PlaceholderScreen('Employer My Jobs'),
      ),
      GoRoute(
        path: RouteNames.employerPayments,
        builder: (context, state) => const _PlaceholderScreen('Payments'),
      ),
      GoRoute(
        path: RouteNames.employerProfile,
        builder: (context, state) => const _PlaceholderScreen('Employer Profile'),
      ),
    ],
    errorBuilder: (context, state) => const _PlaceholderScreen('404 — Not Found'),
  );
});
