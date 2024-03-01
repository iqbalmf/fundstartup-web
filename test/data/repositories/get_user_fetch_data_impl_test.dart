import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundstartup_app/data/models/user_model.dart';
import 'package:fundstartup_app/data/repositories/user_repository_impl.dart';
import 'package:fundstartup_app/domain/entities/user_entity.dart';
import 'package:fundstartup_app/utils/error/exception.dart';
import 'package:fundstartup_app/utils/error/failure.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockUserRemoteDataSource mockUserRemoteDataSource;
  late UserRepositoryImpl userRepositoryImpl;
  late MockNetworkInfo mockNetworkInfo;
  setUp(() {
    mockUserRemoteDataSource = MockUserRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    userRepositoryImpl = UserRepositoryImpl(
        remoteDataSource: mockUserRemoteDataSource,
        networkInfo: mockNetworkInfo);
  });

  group('get fetch user', () {
    final testUserModel = UserModel(
      idUser: 1,
      name: "Iqbal",
      occupation: "Karyawan",
      email: "test@test.com",
      token: "xxx",
      avatarImage: "avatar_images/x",
    );

    final testUserEntity = UserEntity(
      idUser: 1,
      name: "Iqbal",
      occupation: "Karyawan",
      email: "test@test.com",
      token: "xxx",
      avatarImage: "avatar_images/x",
    );

    test("should return user data when a call data source is successfull", () async {
      when(mockUserRemoteDataSource.fetchUser()).thenAnswer((realInvocation) async {
        return testUserModel;
      });
      final result = await userRepositoryImpl.fetchUserData();
      expect(result, equals(Right(testUserEntity)));
      verify(mockUserRemoteDataSource.fetchUser());
    });

    test("should return throw exception when a call data source is unsuccessfull", () async {
      when(mockUserRemoteDataSource.fetchUser()).thenThrow(ServerException());
      final result = await userRepositoryImpl.fetchUserData();
      expect(result, equals(Left(ServerFailure("Internal server error"))));
      verify(mockUserRemoteDataSource.fetchUser());
    });

    test("should return throw exception when a call data source not internet connection", () async {
      when(mockUserRemoteDataSource.fetchUser()).thenThrow(SocketException(""));
      final result = await userRepositoryImpl.fetchUserData();
      expect(result, equals(Left(ConnectionFailure("Failed to connect to the network"))));
      verify(mockUserRemoteDataSource.fetchUser());
    });
  });
}
