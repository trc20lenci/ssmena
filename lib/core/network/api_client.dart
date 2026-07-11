import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_interceptors.dart';

/// General-purpose Dio client for calls that do NOT go through Supabase
/// (e.g. a payment processor adapter, geocoding, SMS gateway webhooks).
/// Supabase's own Postgrest/Auth/Storage calls use the supabase_flutter
/// SDK directly via [supabaseClientProvider] — not this client.
final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      contentType: 'application/json',
    ),
  );

  dio.interceptors.addAll([
    LoggingInterceptor(),
    ErrorInterceptor(),
  ]);

  return dio;
});
