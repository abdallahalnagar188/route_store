// common_header.dart
import 'package:flutter/material.dart';
import 'package:route_store/core/constants/colors.dart';
import 'package:route_store/core/constants/images.dart';
import '../text_field/search_form.dart';

class CommonHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onCartPressed;

  const CommonHeader({
    super.key,
    required this.title,
    this.onCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            RImages.homeLogo,
            height: 28,
            width: 80,
            color: RColors.primary,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Expanded(child: SearchForm()),
              const SizedBox(width: 16),
              IconButton(
                onPressed: onCartPressed,
                icon:  Image.asset(RImages.cartIcon,width: 26,height: 26,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}