import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fundstartup_app/data/datasource/user_remote_datasource.dart';
import 'package:fundstartup_app/data/models/user_model.dart';
import 'package:fundstartup_app/data/models/user_model_input.dart';
import 'package:fundstartup_app/utils/error/exception.dart';
import 'package:fundstartup_app/utils/network/config/endpoints.dart';
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
  late MockNetworkClient mockNetworkClient;

  setUp(() {
    mockDioClient = MockDioClient();
    mockNetworkClient = MockNetworkClient();
    dataSourceImpl = UserRemoteDataSourceImpl(dio: mockDioClient, networkClient: mockNetworkClient);
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

  group("get fetch user data", () {
    final tUserModel = UserModel.fromJson(json.decode(jsonReader('user.json')));
    final httpResponse = Future.value(Response(
        data: jsonReader('user.json'),
        requestOptions: RequestOptions(
            headers: {Headers.contentTypeHeader: Headers.jsonContentType}),
        statusCode: HttpStatus.ok));

    test(
        "should perform a GET request on URL with empty param and with application/json header",
            () async {
          when(
            mockNetworkClient.get(
              Endpoints.fetchUser,
            ),
          ).thenAnswer((_) async => httpResponse);
          dataSourceImpl.fetchUser();
          verify(
            mockNetworkClient.get(Endpoints.fetchUser),
          );
        });
  });
}
