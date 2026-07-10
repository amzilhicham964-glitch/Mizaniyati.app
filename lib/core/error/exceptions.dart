class AppException implements Exception {
  final String message;
  final String? code;
  final dynamic originalException;
  final StackTrace? stackTrace;

  AppException({
    required this.message,
    this.code,
    this.originalException,
    this.stackTrace,
  });

  @override
  String toString() => message;
}

class AuthException extends AppException {
  AuthException({
    required String message,
    String? code,
    dynamic originalException,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code,
    originalException: originalException,
    stackTrace: stackTrace,
  );
}

class ValidationException extends AppException {
  ValidationException({
    required String message,
    String? code,
  }) : super(
    message: message,
    code: code,
  );
}

class NetworkException extends AppException {
  NetworkException({
    required String message,
    String? code,
    dynamic originalException,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code,
    originalException: originalException,
    stackTrace: stackTrace,
  );
}

class CacheException extends AppException {
  CacheException({
    required String message,
    String? code,
    dynamic originalException,
    StackTrace? stackTrace,
  }) : super(
    message: message,
    code: code,
    originalException: originalException,
    stackTrace: stackTrace,
  );
}
