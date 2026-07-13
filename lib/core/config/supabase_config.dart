import 'package:flutter_dotenv/flutter_dotenv.dart';

class SupabaseConfig {
  SupabaseConfig._();

  static String get url {
    final value = dotenv.env['SUPABASE_URL'];
    if (value == null || value.isEmpty) {
      throw StateError('SUPABASE_URL is missing. Check your .env file.');
    }
    return value;
  }

  static String get publishableKey {
    final value = dotenv.env['SUPABASE_PUBLISHABLE_KEY'];
    if (value == null || value.isEmpty) {
      throw StateError('SUPABASE_PUBLISHABLE_KEY is missing. Check your .env file.');
    }
    return value;
  }

  static const bool debugMode = !bool.fromEnvironment('dart.vm.product');
}