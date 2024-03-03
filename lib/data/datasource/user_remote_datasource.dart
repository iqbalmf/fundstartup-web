import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fundstartup_app/utils/error/exception.dart';
import 'package:fundstartup_app/data/models/user_model_input.dart';
import 'package:fundstartup_app/utils/network/config/endpoints.dart';
import 'package:fundstartup_app/utils/network/network_client.dart';

import '../models/user_model.dart';

/**
 * Created by IqbalMF on 2024.
 * Package data.datasource
 */
abstract class UserRemoteDataSource {
  Future<UserModel> getUserLogin(UserModelInput input);
  Future<UserModel> fetchUser();
  Future<UserModel> createNewUser(NewUserModelInput input);
  Future<bool> checkEmailAvaibility(String email);
  Future<bool> uploadUserAvatar(File file);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;
  final NetworkClient networkClient;

  UserRemoteDataSourceImpl({required this.dio, required this.networkClient});

  @override
  Future<UserModel> getUserLogin(UserModelInput input) => _getUserDataFromRemote("localhost:8081/sessions", dio, {'email': input.email, 'password': input.password});

  Future<UserModel> _getUserDataFromRemote(String url, Dio dio, dynamic data) async {
    final response = await dio.post(url, data: data);
    if (response.statusCode == HttpStatus.ok) {
      return UserModel.fromJson(jsonDecode(response.data));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> fetchUser() async {
    final response = await networkClient.get(Endpoints.fetchUser);
    return UserModel.fromJson(jsonDecode(response.data));
  }

  @override
  Future<bool> checkEmailAvaibility(String email) async {
    final response = await networkClient.post(Endpoints.emailChecker);
    return response.data["is_available"];
  }

  @override
  Future<UserModel> createNewUser(NewUserModelInput input) {
    // TODO: implement createNewUser
    throw UnimplementedError();
  }

  @override
  Future<bool> uploadUserAvatar(File file) {
    // TODO: implement uploadUserAvatar
    throw UnimplementedError();
  }
}
