import '../../../../core/utils/result.dart';
import '../entities/user_entity.dart';
import '../repo/auth_repo.dart';

class LoginParams {
  final String email;
  final String password;


  LoginParams({required this.email, required this.password});
}


class LoginUseCase {
  final AuthRepository repository;


  LoginUseCase(this.repository);


  Future<Result<UserEntity>> call(LoginParams params) async {
    return repository.login(params.email, params.password);
  }
}
