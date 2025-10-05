import 'package:dio/dio.dart';

class DioFactory {
  static Dio getDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://ecommerce.routemisr.com',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        responseType: ResponseType.json,
      ),
    );

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));

    return dio;
  }
}
