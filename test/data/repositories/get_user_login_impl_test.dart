import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundstartup_app/data/models/user_model.dart';
import 'package:fundstartup_app/data/models/user_model_input.dart';
import 'package:fundstartup_app/data/repositories/user_repository_impl.dart';
import 'package:fundstartup_app/domain/entities/user_entity.dart';
import 'package:fundstartup_app/utils/error/exception.dart';
import 'package:fundstartup_app/utils/error/failure.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

/**
 * Created by IqbalMF on 2024.
 * Package data.repositories
 */

void main() {
  late MockUserRemoteDataSource userRemoteDataSource;
  late UserRepositoryImpl userRepositoryImpl;
  late MockNetworkInfo networkInfo;
  late MockUserModelInput mockUserModelInput;
  setUp(() {
    userRemoteDataSource = MockUserRemoteDataSource();
    networkInfo = MockNetworkInfo();
    userRepositoryImpl = UserRepositoryImpl(
        remoteDataSource: userRemoteDataSource, networkInfo: networkInfo);
    mockUserModelInput = MockUserModelInput();
  });


  void runTestOnline(Function body) {
    group('device is online', () {
      setUp(() =>
          when(networkInfo.isConnected).thenAnswer((_) async => true));
      body();
    });
  }

  void runTestOffline(Function body) {
    group('device is offline', () {
      setUp(() =>
          when(networkInfo.isConnected).thenAnswer((_) async => false));
      body();
    });
  }

  group("getLoginUserEntity", () {
    final email = "test@test.com";
    final password = "password";
    final testUserModel = UserModel(
      idUser: 1,
      name: "Iqbal",
      occupation: "Karyawan",
      email: "test@test.com",
      token: "xxx",
      avatarImage: "avatar_images/x",);

    final testUserEntity = UserEntity(
      idUser: 1,
      name: "Iqbal",
      occupation: "Karyawan",
      email: "test@test.com",
      token: "xxx",
      avatarImage: "avatar_images/x",);

    runTestOnline((){
      test("should return user data when a call to data source is successfull", () async {
        when(userRemoteDataSource.getUserLogin(any)).thenAnswer((_) async => testUserModel);

        final result = await userRepositoryImpl.getUserLogin(mockUserModelInput);

        verify(userRemoteDataSource.getUserLogin(mockUserModelInput));
        expect(result, equals(Right(testUserEntity)));
      });
      
      test("should return server failure when a call to data source is unsuccessfull", () async {
        when(userRemoteDataSource.getUserLogin(any)).thenThrow(ServerException());

        final result = await userRepositoryImpl.getUserLogin(mockUserModelInput);

        verify(userRemoteDataSource.getUserLogin(mockUserModelInput));
        expect(result, equals(Left(ServerFailure("Internal server error"))));
      });
      
      test("should return connection failure when app has no internet connection", () async {
        when(userRemoteDataSource.getUserLogin(any)).thenThrow(SocketException(""));

        final result = await userRepositoryImpl.getUserLogin(mockUserModelInput);

        verify(userRemoteDataSource.getUserLogin(mockUserModelInput));
        expect(result, equals(Left(ConnectionFailure("Failed to connect to the network"))));
      });
    });

    runTestOffline((){

    });
  });


}
