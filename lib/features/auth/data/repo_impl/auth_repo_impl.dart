import 'package:dio/dio.dart';

import '../../../../core/utils/result.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repo/auth_repo.dart';
import '../data_sources/auth_remote_data_store.dart';
import '../models/user.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<UserEntity>> login(String email, String password) async {
    try {
      final response = await remoteDataSource.login(email, password);

      // ✅ Explicitly check for success message
      if (response.statusCode == 200 &&
          (response.data['message']?.toLowerCase() == 'success')) {
        final user = UserModel.fromJson(response.data['user']);
        return Result.success(user);
      } else {
        // Handle API error message gracefully
        final message = response.data['message'] ?? 'Login failed';
        return Result.failure(message);
      }
    } on DioException catch (e) {
      // ✅ Catch Dio-specific errors for better feedback
      final message = e.response?.data['message'] ?? e.message ?? 'Network error';
      return Result.failure(message);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}
