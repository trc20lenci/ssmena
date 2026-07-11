import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'core/config/supabase_config.dart';
import 'core/storage/local_storage_service.dart';

/// Single initialization entry point. Keeping this separate from
/// main.dart matches SMENA_ARCHITECTURE §2.2 (`bootstrap.dart`) and
/// makes it trivial to add flavors (dev/staging/prod) later without
/// touching main.dart.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Never hardcode secrets — see SMENA_CODING_GUIDE §8.
  await dotenv.load(fileName: '.env');

  await Supabase.initialize(
    url: SupabaseConfig.url,
    anonKey: SupabaseConfig.anonKey,
    debug: SupabaseConfig.debugMode,
  );

  // SharedPreferences needs async init, so it can't live inside a plain
  // Riverpod Provider — we create it once here and inject it via override.
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        localStorageProvider.overrideWithValue(
          LocalStorageService(sharedPreferences),
        ),
      ],
      child: const SmenaApp(),
    ),
  );
}
