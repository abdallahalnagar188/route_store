import 'package:dio/dio.dart';

class DioErrorHandler {
  static String getErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please try again.';
      case DioExceptionType.sendTimeout:
        return 'Request send timeout. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Server took too long to respond.';
      case DioExceptionType.badResponse:
        return e.response?.data['message'] ?? 'Invalid response from server.';
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.unknown:
        return 'No Internet connection.';
      default:
        return e.message ?? 'Something went wrong.';
    }
  }
}
