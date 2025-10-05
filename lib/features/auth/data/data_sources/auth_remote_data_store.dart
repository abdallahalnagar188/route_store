import 'package:dio/dio.dart';
import '../models/user.dart';
import '../../../../core/network/dio_factory.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await dio.post(
      '/api/v1/auth/signin',
      data: {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode == 200) {
      final json = response.data;

      // Check if “data” exists
      if (json['status'] == true && json['data'] != null) {
        // data is inside “data” key
        final dataJson = json['data'];
        return UserModel.fromJson(dataJson);
      } else {
        // handle error
        final String msg = json['message'] ?? 'Unknown error';
        throw Exception('Login failed: $msg');
      }
    } else {
      throw Exception('Login failed: ${response.statusCode} ${response.statusMessage}');
    }
  }
}
