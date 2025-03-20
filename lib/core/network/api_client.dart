import 'package:calendar_app/core/network/api_endpoints.dart';
import 'package:calendar_app/core/network/logging_interceptor.dart';
import 'package:dio/dio.dart';

abstract class ApiClient {
  ApiClient() {
    dio = createDio(
      BaseOptions(
        receiveTimeout: const Duration(milliseconds: 60000),
        connectTimeout: const Duration(milliseconds: 60000),
        sendTimeout: const Duration(milliseconds: 60000),
        baseUrl: ApiEndpoints.baseUrl,
        validateStatus: (status) {
          return true;
        },
      ),
    );
  }

  late Dio dio;

  Dio createDio(BaseOptions baseOptions) {
    final dio = Dio(baseOptions);
    dio.interceptors.add(LoggingInterceptor());

    return dio;
  }
}
