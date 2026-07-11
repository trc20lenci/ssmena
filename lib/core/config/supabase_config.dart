import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Central place for Supabase configuration. Values load from `.env`
/// (see `.env.example`) — never hardcode secrets (SMENA_CODING_GUIDE §8).
class SupabaseConfig {
  SupabaseConfig._();

  static String get url {
    final value = dotenv.env['SUPABASE_URL'];
    if (value == null || value.isEmpty) {
      throw StateError('SUPABASE_URL is missing. Check your .env file.');
    }
    return value;
  }

  static String get anonKey {
    final value = dotenv.env['SUPABASE_ANON_KEY'];
    if (value == null || value.isEmpty) {
      throw StateError('SUPABASE_ANON_KEY is missing. Check your .env file.');
    }
    return value;
  }

  static const bool debugMode = !bool.fromEnvironment('dart.vm.product');
}
