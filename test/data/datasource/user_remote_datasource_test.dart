import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundstartup_app/data/datasource/user_datasource.dart';
import 'package:fundstartup_app/data/exception.dart';
import 'package:fundstartup_app/data/failure.dart';
import 'package:fundstartup_app/data/models/user_model.dart';
import 'package:fundstartup_app/data/models/user_model_input.dart';
import 'package:fundstartup_app/utils/api_helper.dart';
import 'package:mockito/mockito.dart';

import '../../helper/json_reader.dart';
import '../../helper/test_helper.mocks.dart';

/**
 * Created by IqbalMF on 2024.
 * Package data.datasource
 */

// class DioAdapterMock extends Mock implements HttpClientAdapter {}

void main() {
  late MockDioClient mockDioClient;
  late UserRemoteDataSourceImpl dataSourceImpl;

  setUp(() {
    mockDioClient = MockDioClient();
    dataSourceImpl = UserRemoteDataSourceImpl(dio: mockDioClient);
    // dioAdapterMock = DioAdapterMock();
    // tDio.httpClientAdapter = dioAdapterMock;
    // tApi = ApiHelper(tDio);
  });

  group('get user login', () {
    const tEmail = "test@test.com";
    const tPassword = "password";
    final tUserInput = UserModelInput(tEmail, tPassword);
    final tUserModel = UserModel.fromJson(json.decode(jsonReader('user.json')));
    final httpResponse = Future.value(Response(
        data: jsonReader('user.json'),
        requestOptions: RequestOptions(
            headers: {Headers.contentTypeHeader: Headers.jsonContentType}),
        statusCode: HttpStatus.ok));

    test(
        "should perform a POST request on URL with input data class and with application/json header",
        () async {
      when(
        mockDioClient.post(
          "localhost:8081/sessions",
          data: tUserInput.toJson(),
        ),
      ).thenAnswer((_) async => httpResponse);
      dataSourceImpl.getUserLogin(tUserInput);
      verify(
        mockDioClient.post("localhost:8081/sessions",
            data: tUserInput.toJson()),
      );
    });

    test('should return user model when response code 200', () async {
      when(
        mockDioClient.post(any, data: tUserInput.toJson()),
      ).thenAnswer((_) async => httpResponse);
      final response = await dataSourceImpl.getUserLogin(tUserInput);
      expect(response, equals(tUserModel));
    });

    test(
        "should throw a server exception when the response code is 404 or other",
        () async {
      when(mockDioClient.post(any, data: tUserInput.toJson()))
          .thenAnswer((realInvocation) => Future.value(Response(
                data: "Something when wrong",
                requestOptions: RequestOptions(headers: {
                  Headers.contentTypeHeader: Headers.jsonContentType
                }),
                statusCode: HttpStatus.notFound,
              )));
      final call = dataSourceImpl.getUserLogin;
      expect(() => call(tUserInput), throwsA(isA<ServerException>()));
    });
  });
}
