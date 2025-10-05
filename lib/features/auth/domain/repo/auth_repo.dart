import '../../../../core/utils/result.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  /// Returns Result.success(user) or Result.failure(message)
  Future<Result<UserEntity>> login(String email, String password);
  /// Returns Result.success(user) or Result.failure(message)
  Future<Result<UserEntity>> register({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  });

}