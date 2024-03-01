import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundstartup_app/data/models/user_model_input.dart';
import 'package:fundstartup_app/domain/entities/user_entity.dart';
import 'package:fundstartup_app/domain/usecase/get_user_login_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

/**
 * Created by IqbalMF on 2024.
 * Package domain.usecase
 */

void main() {
  late MockUserRepository mockUserRepository;
  late GetUserLoginUseCase getUserLoginUseCase;
  setUp(() {
    mockUserRepository = MockUserRepository();
    getUserLoginUseCase = GetUserLoginUseCase(mockUserRepository);
  });

  final testUserEntity = UserEntity(
      idUser: 1,
      name: "Iqbal",
      occupation: "Karyawan",
      email: "test@test.com",
      token: "xxx",
      avatarImage: "avatar_images/x",);
  const tUserEmail = "mail@mail.com";
  const tUserPass = "password";

  test('should get user from the repository', () async {
    //arrange
    when(mockUserRepository.getUserLogin(any)).thenAnswer((_) async => Right(testUserEntity));
    //act
    final result = await getUserLoginUseCase.execute(UserModelInput(tUserEmail, tUserPass));
    //assert
    expect(result, Right(testUserEntity));
    verify(mockUserRepository.getUserLogin(any));
    verifyNoMoreInteractions(mockUserRepository);
  });
}
