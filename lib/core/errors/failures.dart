import 'package:flutter/foundation.dart';

/// UI-facing failure types. Repositories map thrown exceptions into
/// these before they reach the presentation layer — the UI must never
/// catch a generic `Exception` to decide what to render.
/// SMENA_CODING_GUIDE §6.
@immutable
sealed class Failure {
  const Failure(this.message);
  final String message;
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Something went wrong on our end.']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No connection. Please try again.']);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

class AuthFailure extends Failure {
  const AuthFailure([super.message = 'Authentication failed.']);
}

class RateLimitFailure extends Failure {
  const RateLimitFailure([super.message = 'Too many attempts. Try again later.']);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Not found.']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Unexpected error.']);
}
