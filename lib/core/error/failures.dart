abstract class Failure {
  final String message;
  final int? statusCode;

  Failure(this.message, [this.statusCode]);

  @override
  String toString() => message;
}

class NetworkFailure extends Failure {
  NetworkFailure(super.message, [super.statusCode]);
}

class ServerFailure extends Failure {
  ServerFailure(super.message, [super.statusCode]);
}
