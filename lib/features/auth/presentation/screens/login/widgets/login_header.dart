import 'package:flutter/material.dart';
import 'package:route_store/core/constants/images.dart';
import '../../../../../../core/constants/colors.dart';
import '../../../../../../core/constants/sizes.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
      children: [
        Center(
          child: Image.asset(
            RImages.logo,
            height: 70,
            width: 200,
            color: RColors.white,
          ),
        ),
        const SizedBox(height: RSizes.spaceBtwSections *2),
         Text(
          'Welcome Back To Route',
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: RColors.white),
        ),
         Text(
          'Please login to continue',
          style: Theme.of(context).textTheme.labelMedium!.apply(color: RColors.white),
        ),
      ],
    );
  }
}
