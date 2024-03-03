import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fundstartup_app/data/models/user_model_input.dart';

import '../../utils/error/failure.dart';
import '../entities/user_entity.dart';

/**
 * Created by IqbalMF on 2024.
 * Package domain.repository
 */

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUserLogin(UserModelInput input);
  Future<Either<Failure, UserEntity>> fetchUserData();
  Future<Either<Failure, UserEntity>> createNewUser(NewUserModelInput input);
  Future<Either<Failure, bool>> checkEmailAvailbility(String email);
  Future<Either<Failure, bool>> uploadedAvatar(File fileImage);
}