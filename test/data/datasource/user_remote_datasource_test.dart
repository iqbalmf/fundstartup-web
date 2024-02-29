import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundstartup_app/data/datasource/user_datasource.dart';
import 'package:fundstartup_app/data/models/user_model.dart';
import 'package:fundstartup_app/data/models/user_model_input.dart';
import 'package:fundstartup_app/utils/api_helper.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:mockito/mockito.dart';

import '../../helper/json_reader.dart';
import '../../helper/test_helper.mocks.dart';

/**
 * Created by IqbalMF on 2024.
 * Package data.datasource
 */

void main() {
  late MockDioClient mockDioClient;
  late UserRemoteDataSourceImpl dataSourceImpl;

  setUp(() {
    mockDioClient = MockDioClient();
    dataSourceImpl = UserRemoteDataSourceImpl(ApiHelper(mockDioClient));
  });

  group('get user login', () {
    final tEmail = "test@test.com";
    final tPassword = "password";
    final tUserInput = UserModelInput(tEmail, tPassword);
    final tUserModel =
        UserModel.fromJson(json.decode(jsonReader('user.json')));

    test('should return user model when response code 200', () async {

      // when(() => dioAdapter.post(any, data: any)).thenAnswer(
      //     (_) => Future.value(Response(requestOptions: any, statusCode: 200, data: tUserInput)));

      final response = await dataSourceImpl.getUserLogin(tUserInput);
      expect(response, equals(tUserModel));
    });
  });
}
