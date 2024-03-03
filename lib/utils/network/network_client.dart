import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'config/endpoints.dart';
import 'interceptor/network_interceptor.dart';

/**
 * Created by IqbalMF on 2024.
 * Package utils.network
 */

class NetworkClient {
  late Dio _dio;

  NetworkClient(){
    _createInstance();
  }

  Future<Dio> _createInstance() async {
    // sessionManager = await SessionManager().initSharedPreferences();
    Duration timeoutDuration =
    const Duration(seconds: Endpoints.connectionTimeout);
    _dio = Dio(BaseOptions(
      baseUrl: Endpoints.baseURL,
      receiveTimeout: timeoutDuration,
      connectTimeout: timeoutDuration,
      sendTimeout: timeoutDuration,
      responseType: ResponseType.json,
    ));

    _dio.interceptors.addAll({
      NetworkInterceptor(_dio),
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,)
    });
    return _dio;
  }

  Future<Response> get(
      String url, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
      String url, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options:
        options ?? Options(headers: {Headers.contentTypeHeader: Headers.jsonContentType}),
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
