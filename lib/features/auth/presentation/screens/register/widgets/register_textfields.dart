import 'package:flutter/material.dart';

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
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Full Name'),
          validator: (v) => v!.isEmpty ? 'Enter your name' : null,
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: emailController,
          decoration: const InputDecoration(labelText: 'Email'),
          validator: (v) => v!.isEmpty
              ? 'Enter your email'
              : (!v.contains('@') ? 'Enter valid email' : null),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: phoneController,
          decoration: const InputDecoration(labelText: 'Phone'),
          validator: (v) => v!.isEmpty ? 'Enter your phone' : null,
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(labelText: 'Password'),
          validator: (v) =>
          v!.length < 6 ? 'Password must be at least 6 characters' : null,
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: rePasswordController,
          obscureText: true,
          decoration: const InputDecoration(labelText: 'Confirm Password'),
          validator: (v) =>
          v != passwordController.text ? 'Passwords do not match' : null,
        ),
      ],
    );
  }
}
