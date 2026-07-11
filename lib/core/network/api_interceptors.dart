import 'package:dio/dio.dart';

import '../errors/exceptions.dart';

/// Logs requests/responses in debug builds only. Per SMENA_CODING_GUIDE
/// §7: NEVER log phone numbers, tokens, OTP codes, or other PII —
/// method/path/status only.
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    assert(() {
      // ignore: avoid_print
      print('[HTTP] -> ${options.method} ${options.path}');
      return true;
    }());
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    assert(() {
      // ignore: avoid_print
      print('[HTTP] <- ${response.statusCode} ${response.requestOptions.path}');
      return true;
    }());
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    assert(() {
      // ignore: avoid_print
      print('[HTTP] !! ${err.requestOptions.path} — ${err.message}');
      return true;
    }());
    handler.next(err);
  }
}

/// Converts transport-level Dio errors into our own [AppException]
/// types, which [mapErrorToFailure] then turns into [Failure]s for
/// the UI. SMENA_CODING_GUIDE §6.
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        handler.next(
          err.copyWith(
            error: const NetworkException('Connection problem. Check your internet.'),
          ),
        );
        return;
      case DioExceptionType.badResponse:
        final status = err.response?.statusCode ?? 0;
        if (status == 429) {
          handler.next(err.copyWith(error: const RateLimitException()));
          return;
        }
        if (status >= 500) {
          handler.next(err.copyWith(error: const ServerException()));
          return;
        }
        handler.next(err);
        return;
      default:
        handler.next(err);
    }
  }
}
