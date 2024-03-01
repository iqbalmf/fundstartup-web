import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundstartup_app/domain/entities/user_entity.dart';
import 'package:fundstartup_app/domain/usecase/get_user_data_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

/**
 * Created by IqbalMF on 2024.
 * Package domain.usecase
 */

void main(){
  late MockUserRepository mockUserRepository;
  late GetUserDataUseCase getUserDataUseCase;

  setUp(() {
    mockUserRepository = MockUserRepository();
    getUserDataUseCase = GetUserDataUseCase(userRepository: mockUserRepository);
  });

  final tUserEntity = UserEntity(
    idUser: 1,
    name: "Iqbal",
    occupation: "Karyawan",
    email: "test@test.com",
    token: "xxx",
    avatarImage: "avatar_images/x",);

  test("should get user from repository", () async {
    when(mockUserRepository.fetchUserData()).thenAnswer((realInvocation) async => Right(tUserEntity));

    final result = await getUserDataUseCase.execute();
    expect(result, Right(tUserEntity));
    verify(mockUserRepository.fetchUserData());
    verifyNoMoreInteractions(mockUserRepository);
  });
}