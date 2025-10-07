import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecase/regester_usecase.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase registerUseCase;

  // Form & Controllers managed here
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  RegisterCubit(this.registerUseCase) : super(RegisterInitial());

  Future<void> register() async {
    if (!(formKey.currentState?.validate() ?? false)) return;

    emit(RegisterLoading());

    try {
      final name = nameController.text.trim();
      final email = emailController.text.trim();
      final phone = phoneController.text.trim();
      final password = passwordController.text.trim();
      final rePassword = rePasswordController.text.trim();

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
    } catch (e) {
      emit(RegisterFailure(e.toString()));
    }
  }

  void reset() => emit(RegisterInitial());

  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    return super.close();
  }
}
