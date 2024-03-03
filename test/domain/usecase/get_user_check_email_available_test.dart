import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundstartup_app/domain/usecase/get_user_check_email_avaibility_usecase.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

/**
 * Created by IqbalMF on 2024.
 * Package domain.usecase
 */
void main(){
  late MockUserRepository mockUserRepository;
  late GetUserCheckEmailAvaibilityUseCase getUserCheckEmailAvaibilityUseCase;

  setUp(() {
    mockUserRepository = MockUserRepository();
    getUserCheckEmailAvaibilityUseCase = GetUserCheckEmailAvaibilityUseCase(mockUserRepository);
  });

  test('should get email avaibility response not null', () async {
    when(mockUserRepository.checkEmailAvailbility(any)).thenAnswer((realInvocation) async => Right(true));
    final result = await getUserCheckEmailAvaibilityUseCase.execute("test@test.com");
    verify(mockUserRepository.checkEmailAvailbility(any)).called(1);
    expect(result, isNotNull, reason: "check not null response form repository");
  });

  test('should get email avaibility response get True', () async {
    when(mockUserRepository.checkEmailAvailbility(any)).thenAnswer((realInvocation) async => Right(true));
    final result = await getUserCheckEmailAvaibilityUseCase.execute("test@test.com");
    verify(mockUserRepository.checkEmailAvailbility(any)).called(1);
    expect(result, Right(true), reason: "check true avaibilty email");
  });

  test('should get email avaibility response get False', () async {
    when(mockUserRepository.checkEmailAvailbility(any)).thenAnswer((realInvocation) async => Right(false));
    final result = await getUserCheckEmailAvaibilityUseCase.execute("test@test.com");
    verify(mockUserRepository.checkEmailAvailbility(any)).called(1);
    expect(result, Right(false), reason: "check false avaibilty email");
  });
}