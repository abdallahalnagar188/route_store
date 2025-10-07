import 'package:flutter/material.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    required this.label,
    required this.headerText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
  });

  final String label;
  final String headerText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final isPasswordField = widget.obscureText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.headerText,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: RColors.white),
        ),
        const SizedBox(height: RSizes.spaceBtwItems),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: isPasswordField && !_isPasswordVisible,
          decoration: InputDecoration(
            labelText: widget.label,
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: RColors.darkerGrey),
            border: InputBorder.none,
            filled: true,
            fillColor: Colors.white,
            suffixIcon: isPasswordField
                ? IconButton(
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: RColors.darkGrey,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
            )
                : null,
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
