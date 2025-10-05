import 'package:dio/dio.dart';
import '../../../../core/error/dio_error_handler.dart';

abstract class AuthRemoteDataSource {
  Future<Response> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<Response> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/auth/signin',
        data: {
          "email": email.trim(),
          "password": password.trim(),
        },
      );
      return response;
    } on DioException catch (e) {
      throw Exception(DioErrorHandler.getErrorMessage(e));
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
