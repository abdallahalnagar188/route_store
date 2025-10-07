import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_store/features/auth/presentation/screens/register/widgets/register_button.dart';
import 'package:route_store/features/auth/presentation/screens/register/widgets/register_textfields.dart';
import '../../../viewmodels/register/register_cubit.dart';


class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          RegisterTextFields(
            nameController: cubit.nameController,
            emailController: cubit.emailController,
            phoneController: cubit.phoneController,
            passwordController: cubit.passwordController,
            rePasswordController: cubit.rePasswordController,
          ),
          const SizedBox(height: 24),
          RegisterButton(onPressed: () => cubit.register()),
        ],
      ),
    );
  }
}
