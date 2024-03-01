import 'package:dartz/dartz.dart';
import 'package:fundstartup_app/data/models/user_model_input.dart';
import 'package:fundstartup_app/domain/entities/user_entity.dart';
import 'package:fundstartup_app/domain/repository/user_repository.dart';

import '../../utils/error/failure.dart';

/**
 * Created by IqbalMF on 2024.
 * Package domain.usecase
 */

class GetUserLoginUseCase{
  final UserRepository repository;
  GetUserLoginUseCase(this.repository);

  Future<Either<Failure, UserEntity>> execute(UserModelInput input) {
    return repository.getUserLogin(input);
  }
}