import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:route_store/features/auth/presentation/screens/register/widgets/register_form.dart';

import '../../../../../core/widgets/loaders/app_loader.dart';
import '../../viewmodels/register/register_cubit.dart';
import '../login/login.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final RegisterCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = GetIt.instance<RegisterCubit>();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Welcome, ${state.user.name}!')),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
          } else if (state is RegisterFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: ${state.message}')),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Create Account')),
            body: state is RegisterLoading
                ? const AppLoader()
                : const SingleChildScrollView(
              padding: EdgeInsets.all(16),
              child: RegisterForm(),
            ),
          );
        },
      ),
    );
  }
}
