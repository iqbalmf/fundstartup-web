import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fundstartup_app/data/exception.dart';
import 'package:fundstartup_app/data/models/user_model_input.dart';

import '../models/user_model.dart';

/**
 * Created by IqbalMF on 2024.
 * Package data.datasource
 */
abstract class UserRemoteDataSource {
  Future<UserModel> getUserLogin(UserModelInput input);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

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
}
