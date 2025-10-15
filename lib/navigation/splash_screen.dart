import 'package:flutter/material.dart';
import 'package:route_store/core/constants/images.dart';
import 'package:route_store/core/local/cash_helper.dart';
import 'package:route_store/core/routing/app_router.dart';
import 'package:route_store/core/routing/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3)); // ⏳ Wait 3 seconds

    final bool isLoggedIn = CacheHelper.getLogin();

    if (!mounted) return;

    if (isLoggedIn) {
      AppRouter.replace(context, Routes.main);
    } else {
      AppRouter.replace(context, Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Image.asset(
        RImages.splash,
        fit: BoxFit.cover,
      ),
    );
  }
}
