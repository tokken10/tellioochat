import 'package:equatable/equatable.dart';

/// Base failure for the application.
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure([String message = 'Server error occurred']) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure([String message = 'Cache error occurred']) : super(message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'Network connection error']) : super(message);
}

class ValidationFailure extends Failure {
  const ValidationFailure([String message = 'Validation failure']) : super(message);
}

class UnknownFailure extends Failure {
  const UnknownFailure([String message = 'Unexpected failure']) : super(message);
}
