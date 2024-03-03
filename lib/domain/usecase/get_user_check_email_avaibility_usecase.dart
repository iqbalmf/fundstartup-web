import 'package:dartz/dartz.dart';
import 'package:fundstartup_app/domain/repository/user_repository.dart';

import '../../utils/error/failure.dart';

/**
 * Created by IqbalMF on 2024.
 * Package domain.usecase
 */
class GetUserCheckEmailAvaibilityUseCase {
  final UserRepository userRepository;

  GetUserCheckEmailAvaibilityUseCase(this.userRepository);

  Future<Either<Failure, bool>> execute(String email) {
    return userRepository.checkEmailAvailbility(email);
  }
}
