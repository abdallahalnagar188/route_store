import 'package:flutter/material.dart';

/// Reusable error widget for horizontal lists
class HorizontalListError extends StatelessWidget {
  final String message;
  final double height;
  final VoidCallback? onRetry;
  final Color? textColor;
  final IconData? icon;

  const HorizontalListError({
    super.key,
    required this.message,
    this.height = 120,
    this.onRetry,
    this.textColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon ?? Icons.error_outline,
                color: textColor ?? Colors.red,
                size: 32,
              ),
              const SizedBox(height: 8),
              Text(
                message,
                style: TextStyle(
                  color: textColor ?? Colors.red,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              if (onRetry != null) ...[
                const SizedBox(height: 12),
                TextButton.icon(
                  onPressed: onRetry,
                  icon: const Icon(Icons.refresh, size: 18),
                  label: const Text('Retry'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
