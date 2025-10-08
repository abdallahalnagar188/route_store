import 'package:flutter/material.dart';

class SubcategoriesScreen extends StatelessWidget {
  final String categoryId;

  const SubcategoriesScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Subcategories')),
      body: Center(
        child: Text('Category ID: $categoryId'),
      ),
    );
  }
}
