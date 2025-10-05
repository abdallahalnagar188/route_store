import '../../../../core/utils/result.dart';
import '../entities/user_entity.dart';
import '../repo/auth_repo.dart';

class RegisterUseCase {
  final AuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Result<UserEntity>> call({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) {
    return repository.register(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }
}
