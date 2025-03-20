abstract class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException(super.message, [super.statusCode]);
}

class ServerException extends AppException {
  ServerException(super.message, [super.statusCode]);
}

class BadRequestException extends AppException {
  BadRequestException(super.message, [super.statusCode]);
}

class NotFoundException extends AppException {
  NotFoundException(super.message, [super.statusCode]);
}

class LocalStorageException extends AppException {
  LocalStorageException(super.message, [super.statusCode]);
}
