import 'package:dartz/dartz.dart';
import 'package:fundstartup_app/domain/entities/user_entity.dart';
import 'package:fundstartup_app/domain/repository/user_repository.dart';
import 'package:fundstartup_app/utils/error/failure.dart';

/**
 * Created by IqbalMF on 2024.
 * Package domain.usecase
 */

class GetUserDataUseCase {
  final UserRepository userRepository;
  GetUserDataUseCase({required this.userRepository});

  Future<Either<Failure, UserEntity>> execute(){
    return userRepository.fetchUserData();
  }
}