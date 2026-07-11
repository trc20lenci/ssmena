import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Exposes the singleton Supabase client to the app. Feature
/// repositories should depend on this provider rather than calling
/// `Supabase.instance.client` directly, so it can be overridden/mocked
/// in tests.
final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

/// Stream of auth state changes — will back the real route guard once
/// `features/auth` exists.
final authStateChangesProvider = StreamProvider<AuthState>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return client.auth.onAuthStateChange;
});
