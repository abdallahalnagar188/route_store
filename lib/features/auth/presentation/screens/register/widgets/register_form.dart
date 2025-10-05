import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_store/features/auth/presentation/screens/register/widgets/register_button.dart';
import 'package:route_store/features/auth/presentation/screens/register/widgets/register_textfields.dart';

import '../../../viewmodels/register/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _rePasswordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _rePasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<RegisterCubit>().register(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        rePassword: _rePasswordController.text.trim(),
        phone: _phoneController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          RegisterTextFields(
            nameController: _nameController,
            emailController: _emailController,
            phoneController: _phoneController,
            passwordController: _passwordController,
            rePasswordController: _rePasswordController,
          ),
          const SizedBox(height: 24),
          RegisterButton(onPressed: () => _onSubmit(context)),
        ],
      ),
    );
  }
}
