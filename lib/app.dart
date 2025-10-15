import 'package:flutter/material.dart';
import 'core/constants/app_constants.dart';
import 'core/local/cash_helper.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/utils/theme/theme.dart';
import 'navigation/splash_screen.dart'; // 👈 import your splash

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      // ✅ Always start from SplashScreen
      home: const SplashScreen(),
      themeMode: ThemeMode.system,
      theme: MyAppTheme.lightTheme,
      darkTheme: MyAppTheme.darkTheme,
    );
  }
}
