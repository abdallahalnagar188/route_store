import 'package:flutter/material.dart';

import '../error/error_widget.dart';
import '../loaders/list_loading.dart';
import 'empty_list.dart';

/// Generic reusable state widget that can handle all states
class HorizontalListStateHandler extends StatelessWidget {
  final bool isLoading;
  final String? errorMessage;
  final bool isEmpty;
  final Widget child;
  final double height;
  final VoidCallback? onRetry;
  final String emptyMessage;

  const HorizontalListStateHandler({
    super.key,
    required this.isLoading,
    this.errorMessage,
    required this.isEmpty,
    required this.child,
    this.height = 120,
    this.onRetry,
    this.emptyMessage = 'No items found',
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return HorizontalListLoading(height: height);
    }

    if (errorMessage != null) {
      return HorizontalListError(
        message: errorMessage!,
        height: height,
        onRetry: onRetry,
      );
    }

    if (isEmpty) {
      return HorizontalListEmpty(
        message: emptyMessage,
        height: height,
      );
    }

    return child;
  }
}