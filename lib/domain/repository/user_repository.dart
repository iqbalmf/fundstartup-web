import 'package:dartz/dartz.dart';

import '../../data/failure.dart';
import '../entities/user_entity.dart';

/**
 * Created by IqbalMF on 2024.
 * Package domain.repository
 */

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUserLogin(String email, String password);
}