import 'package:flutter/material.dart';
import 'package:route_store/core/constants/colors.dart';
import 'package:route_store/core/constants/sizes.dart';
import 'package:route_store/features/auth/presentation/screens/forget_password/forget_password.dart';
import '../../../viewmodels/login/login_cubit.dart';
import '../../register/register.dart';
import 'app_text_form.dart';

class LoginForm extends StatelessWidget {
  final LoginCubit cubit;

  const LoginForm({required this.cubit, super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: cubit.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextFormField(
            label: 'enter your email',
            headerText: 'Email',
            controller: cubit.emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (value) => value != null && value.contains('@')
                ? null
                : 'Enter valid email',
          ),

          const SizedBox(height: RSizes.spaceBtwInputFields * 2),
          AppTextFormField(
            label: 'enter your password',
            headerText: 'Password',
            controller: cubit.passwordController,
            obscureText: true,
            validator: (value) => value != null && value.length >= 6
                ? null
                : 'Enter valid password',
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const ForgetPasswordScreen())),
                child:  Text('Forgot password?',  style: Theme.of(context).textTheme.bodyMedium!.apply(color: RColors.white)),
              )
            ],
          ),

          const SizedBox(height: RSizes.spaceBtwSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: RColors.white,
              ),
              onPressed: cubit.login,
              child: Text(
                'Login',
                style: Theme.of(context,).textTheme.titleMedium!.apply(color: RColors.primary),),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Don\'t have an account?', style: Theme.of(context).textTheme.bodyMedium!.apply(color: RColors.white)),
              TextButton(
                onPressed: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const RegisterScreen())),
                child:  Text('Create account',  style: Theme.of(context).textTheme.bodyMedium!.apply(color: RColors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
