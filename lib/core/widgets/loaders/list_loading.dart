import 'package:flutter/material.dart';

/// Reusable loading widget for horizontal lists
class HorizontalListLoading extends StatelessWidget {
  final double height;
  final Color? indicatorColor;

  const HorizontalListLoading({
    super.key,
    this.height = 120,
    this.indicatorColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: indicatorColor != null
              ? AlwaysStoppedAnimation<Color>(indicatorColor!)
              : null,
        ),
      ),
    );
  }
}
