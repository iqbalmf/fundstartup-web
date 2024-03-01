import 'package:dio/dio.dart';
import 'package:fundstartup_app/utils/network/interceptor/network_exception.dart';

/**
 * Created by IqbalMF on 2024.
 * Package utils.network.interceptor
 */

class NetworkInterceptor extends Interceptor {
  final Dio dio;

  NetworkInterceptor(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var accessToken = "JWT_TOKEN";

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    throw NetworkException(requestOptions: err.requestOptions, exception: err);
  }
}