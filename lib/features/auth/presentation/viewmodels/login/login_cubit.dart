import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecase/login_usecase.dart';


part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    try {
      final result = await loginUseCase(LoginParams(email: email, password: password));

      if (result.isSuccess) {
        emit(LoginSuccess(result.data!));
      } else {
        emit(LoginFailure(result.error ?? 'Unknown error'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  // Optional helper for resetting state manually (if needed)
  void reset() => emit(LoginInitial());
}
