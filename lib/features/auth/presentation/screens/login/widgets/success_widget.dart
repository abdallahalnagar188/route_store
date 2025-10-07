import 'package:flutter/material.dart';

class SuccessWidget extends StatelessWidget {
  final String userName;

  const SuccessWidget({required this.userName, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 80),
          const SizedBox(height: 16),
          Text(
            'Welcome, $userName!',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
