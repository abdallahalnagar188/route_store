import '../../../../core/utils/result.dart';
import '../../domain/repo/auth_repo.dart';
import '../../domain/entities/user_entity.dart';
import '../data_sources/auth_remote_data_store.dart';
import '../models/user.dart';


class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;


  AuthRepositoryImpl(this.remoteDataSource);


  @override
  Future<Result<UserEntity>> login(String email, String password) async {
    try {
      final UserModel userModel = await remoteDataSource.login(email, password);
      return Result.success(userModel);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}