import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/local/cash_helper.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecase/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;

  // Form & Controllers managed here
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    emit(LoginLoading());

    try {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      final result = await loginUseCase(LoginParams(email: email, password: password));

      if (result.isSuccess) {
        await CacheHelper.saveLogin(true); // ✅ Perfect place
        emit(LoginSuccess(result.data!));
      } else {
        emit(LoginFailure(result.error ?? 'Unknown error'));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }

  void reset() => emit(LoginInitial());

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
