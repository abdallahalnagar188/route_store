import 'package:flutter/material.dart';

class AllCategoryScreen extends StatelessWidget {
  const AllCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('All Categories Screen',style: Theme.of(context).textTheme.headlineMedium,),
      ),
    );
  }
}
