import 'package:flutter/material.dart';
import 'package:route_store/core/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Container(
        color: RColors.primary,
      ),
    );
  }
}
