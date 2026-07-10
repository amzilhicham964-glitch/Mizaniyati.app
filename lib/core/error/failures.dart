abstract class Failure {
  final String message;
  final String? code;

  Failure(this.message, {this.code});

  @override
  String toString() => message;
}

class FirebaseAuthFailure extends Failure {
  FirebaseAuthFailure(String message, {String? code})
      : super(message, code: code);
}

class FirebaseFirestoreFailure extends Failure {
  FirebaseFirestoreFailure(String message, {String? code})
      : super(message, code: code);
}

class LocalStorageFailure extends Failure {
  LocalStorageFailure(String message, {String? code})
      : super(message, code: code);
}

class NetworkFailure extends Failure {
  NetworkFailure(String message, {String? code})
      : super(message, code: code);
}

class ValidationFailure extends Failure {
  ValidationFailure(String message, {String? code})
      : super(message, code: code);
}

class CacheFailure extends Failure {
  CacheFailure(String message, {String? code})
      : super(message, code: code);
}
