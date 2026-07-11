import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

/// Auth-based redirect logic. Currently a stub that always allows
/// navigation — the real checks (unauthenticated → phone entry,
/// authenticated-without-role → role selection, worker vs. employer
/// route separation per SMENA_MASTER_CONTEXT §10.4) get wired once
/// `features/auth` exists and exposes a real session/role provider.
///
/// TODO(auth-feature): replace with checks against
/// `supabaseClientProvider.auth.currentSession` + the user's `role`.
String? routeGuard(BuildContext context, GoRouterState state) {
  return null; // no redirect yet — foundation only
}
