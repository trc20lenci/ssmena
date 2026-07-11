/// Low-level exceptions thrown by data sources (remote/local).
/// Repositories catch these and map them to [Failure]s before they
/// reach the presentation layer. SMENA_CODING_GUIDE §6 / §11.
sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;

  @override
  String toString() => message;
}

class ServerException extends AppException {
  const ServerException([super.message = 'Something went wrong on our end.']);
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'No connection. Please try again.']);
}

class CacheException extends AppException {
  const CacheException([super.message = 'Local storage error.']);
}

class AuthException extends AppException {
  const AuthException([super.message = 'Authentication failed.']);
}

class ValidationException extends AppException {
  const ValidationException([super.message = 'Invalid input.']);
}

class RateLimitException extends AppException {
  const RateLimitException([super.message = 'Too many attempts. Try again later.']);
}

class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Not found.']);
}
