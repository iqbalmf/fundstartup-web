import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../data/datasource/response_server.dart';
import 'app_config.dart';

class ApiHelper {
  late Dio _dio;

  ApiHelper(Dio dio) {
    _dio = dio;

    _dio.interceptors.add(PrettyDioLogger(
      request: ConstantsApp.modeDevelopment,
      requestBody: ConstantsApp.modeDevelopment,
      requestHeader: ConstantsApp.modeDevelopment,
      responseBody: ConstantsApp.modeDevelopment,
    ));
  }

  Future<dynamic> request(String method, String path,
      {required String contentType,
        Map<String, dynamic>? queryParams,
      dynamic content}) async {
    late Response response;
    var _data = content;
    var headers = {
      "x-api-key": ConstantsApp.apiKey,
      "content-type": contentType,
    };
    _dio.options.headers = headers;
    _dio.options.connectTimeout = const Duration(seconds: 8000);
    _dio.options.receiveTimeout = const Duration(seconds: 8000);

    try {
      if (method == 'POST') {
        response =
        await _dio.post(path, data: _data, queryParameters: queryParams);
      } else {
        response = await _dio.get(path,
            queryParameters: queryParams,
            options: Options(contentType: contentType));
      }

      if (response.statusCode! >= 200 && response.statusCode! <= 300) {
        return ResponseServer(
            data: response.data,
            header: response.headers,
            statusCode: response.statusCode);
      }
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}