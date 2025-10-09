import 'package:flutter/material.dart';

/// Reusable empty state widget for horizontal lists
class HorizontalListEmpty extends StatelessWidget {
  final String message;
  final double height;
  final IconData? icon;
  final Color? textColor;
  final Color? iconColor;

  const HorizontalListEmpty({
    super.key,
    required this.message,
    this.height = 120,
    this.icon,
    this.textColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.inbox_outlined,
              color: iconColor ?? Colors.grey,
              size: 32,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: TextStyle(
                color: textColor ?? Colors.grey,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}