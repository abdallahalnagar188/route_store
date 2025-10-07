import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:route_store/core/constants/sizes.dart';
import 'package:route_store/core/widgets/loaders/app_loader.dart';
import 'package:route_store/features/auth/presentation/screens/login/widgets/failure_widget.dart';
import 'package:route_store/features/auth/presentation/screens/login/widgets/login_form.dart';
import 'package:route_store/features/auth/presentation/screens/login/widgets/login_header.dart';
import 'package:route_store/features/home/presentation/screens/home/home.dart';
import '../../../../../core/constants/colors.dart';
import '../../../../../core/routing/app_router.dart';
import '../../../../../core/routing/routes.dart';
import '../../viewmodels/login/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<LoginCubit>(),
      child: Scaffold(
        backgroundColor: RColors.primary,
        body: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: BlocConsumer<LoginCubit, LoginState>(
            listenWhen: (previous, current) =>
            current is LoginSuccess || current is LoginFailure,
            listener: (context, state) {
              if (state is LoginSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Welcome, ${state.user.name}')),
                );

                // ✅ Safe navigation inside listener
                Future.microtask(() {
                  AppRouter.replace(context, Routes.main);
                });
              } else if (state is LoginFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              final cubit = context.read<LoginCubit>();

              if (state is LoginLoading) {
                return const AppLoader();
              } else if (state is LoginFailure) {
                return FailureWidget(
                  message: state.message,
                  onRetry: () => cubit.login(),
                );
              }

              // Default UI (Idle state)
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const LoginHeader(showTexts: true,),
                  const SizedBox(height: RSizes.spaceBtwSections),
                  LoginForm(cubit: cubit),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
