import 'package:flutter/material.dart';

import '../../../../../../core/constants/colors.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback onPressed;
  const RegisterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return   SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: RColors.white,
        ),
        onPressed: onPressed,
        child: Text(
          'Sign up',
          style: Theme.of(context,).textTheme.titleMedium!.apply(color: RColors.primary),),
      ),
    );
  }
}
