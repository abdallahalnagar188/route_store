import 'package:flutter/material.dart';

import '../../login/widgets/app_text_form.dart';

class RegisterTextFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;

  const RegisterTextFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.rePasswordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: nameController,
          label: 'Full Name',
          validator: (v) => v!.isEmpty ? 'Enter your name' : null,
          headerText: 'Full Name',
        ),
        const SizedBox(height: 12),
        AppTextFormField(
          controller: emailController,
          label: 'Email',
          validator: (v) => v!.isEmpty
              ? 'Enter your email'
              : (!v.contains('@') ? 'Enter valid email' : null),
          headerText: 'Email',
        ),
        const SizedBox(height: 12),

        AppTextFormField(
          controller: phoneController,
          label: 'Phone',
          validator: (v) => v!.isEmpty ? 'Enter your phone' : null,
          headerText: 'Phone',
        ),
        const SizedBox(height: 12),

        AppTextFormField(
          label: 'Password',
          headerText: 'Password',
          validator: (v) => v == null || v.isEmpty ? 'Enter your password' : null,
          controller: passwordController,
          obscureText: true,
        ),
        const SizedBox(height: 12),
        AppTextFormField(
          label: 'Re-enter Password',
          headerText: 'Re-enter Password',
          validator: (v) {
            if (v == null || v.isEmpty) {
              return 'Re-enter your password';
            } else if (v != passwordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
          controller: rePasswordController,
          obscureText: true,
        ),
      ],
    );
  }
}
