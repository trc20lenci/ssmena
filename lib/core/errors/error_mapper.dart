import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

import 'exceptions.dart';
import 'failures.dart';

/// Central place to turn *any* thrown error — Supabase (Auth/Postgrest/
/// Storage), our own [AppException]s from the Dio path, or an unknown
/// error — into a [Failure] the UI can render. Feature repositories
/// should funnel their catch blocks through this single function.
Failure mapErrorToFailure(Object error) {
  if (error is AppException) {
    return switch (error) {
      NetworkException() => NetworkFailure(error.message),
      RateLimitException() => RateLimitFailure(error.message),
      ValidationException() => ValidationFailure(error.message),
      AuthException() => AuthFailure(error.message),
      NotFoundException() => NotFoundFailure(error.message),
      ServerException() || CacheException() => ServerFailure(error.message),
    };
  }

  if (error is supabase.AuthException) {
    return AuthFailure(error.message);
  }

  if (error is supabase.PostgrestException) {
    // PGRST116 = no rows found for a .single() query
    if (error.code == 'PGRST116') {
      return const NotFoundFailure();
    }
    return ServerFailure(error.message);
  }

  if (error is supabase.StorageException) {
    return ServerFailure(error.message);
  }

  return const UnknownFailure();
}
