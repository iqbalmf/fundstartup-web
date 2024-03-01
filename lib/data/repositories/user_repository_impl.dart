import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fundstartup_app/data/datasource/user_remote_datasource.dart';
import 'package:fundstartup_app/utils/error/exception.dart';
import 'package:fundstartup_app/data/models/user_model_input.dart';
import 'package:fundstartup_app/domain/entities/user_entity.dart';
import 'package:fundstartup_app/domain/repository/user_repository.dart';

import '../../utils/error/failure.dart';
import '../../utils/network_info.dart';

/**
 * Created by IqbalMF on 2024.
 * Package data.repositories
 */

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, UserEntity>> getUserLogin(UserModelInput input) async {
    if (await networkInfo.isConnected ?? false) {
      try {
        final result = await remoteDataSource.getUserLogin(input);
        return Right(result.toEntity());
      } on ServerException {
        return Left(ServerFailure("Internal server error"));
      } on SocketException {
        return Left(ConnectionFailure("Failed to connect to the network"));
      }
    } else {
      return Left(ConnectionFailure("Failed to connect to the network"));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> fetchUserData() async{
    // TODO: implement fetchUserData
    throw UnimplementedError();
  }
}
