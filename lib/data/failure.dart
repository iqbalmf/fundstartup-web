import 'package:equatable/equatable.dart';

/**
 * Created by IqbalMF on 2024.
 * Package data
 */

abstract class Failure extends Equatable {
  final String message;
  Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  ConnectionFailure(String message) : super(message);
}

class DatabaseFailure extends Failure {
  DatabaseFailure(String message) : super(message);
}