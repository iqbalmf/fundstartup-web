import 'package:dartz/dartz.dart';
import 'package:fundstartup_app/data/failure.dart';
import 'package:fundstartup_app/domain/entities/user_entity.dart';
import 'package:fundstartup_app/domain/repository/user_repository.dart';

/**
 * Created by IqbalMF on 2024.
 * Package domain.usecase
 */

class GetUserLoginUseCase{
  final UserRepository repository;
  GetUserLoginUseCase(this.repository);

  Future<Either<Failure, UserEntity>> execute(String email, String password) {
    return repository.getUserLogin(email, password);
  }
}