import 'package:dio/dio.dart';

class DioFactory {
  static Dio getDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://ecommerce.routemisr.com/api/v1',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
        responseType: ResponseType.json,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // ✅ Add Logging Interceptor (useful for debugging)
    dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
      ),
    );

    // ✅ Add Error Handling Interceptor (optional but professional)
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, ErrorInterceptorHandler handler) {
          final message = e.response?.data?['message'] ??
              e.message ??
              'Something went wrong';
          print('❌ Dio Error: $message');
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}
