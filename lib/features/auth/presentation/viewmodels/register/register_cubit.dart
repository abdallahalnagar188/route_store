import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecase/regester_usecase.dart';

part 'register_state.dart';


class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  Future<void> register({
    required String name,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) async {

    emit(RegisterLoading());
    final result = await registerUseCase(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );

    if (result.isSuccess) {
      emit(RegisterSuccess(result.data!));
    } else {
      emit(RegisterFailure(result.error ?? 'Unknown error'));
    }
  }
}
