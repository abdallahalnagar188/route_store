import 'package:flutter/material.dart';
import '../../features/auth/presentation/screens/login/login.dart';
import '../../features/auth/presentation/screens/register.dart';
import '../../features/home/presentation/screens/home.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.home:return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static void push(BuildContext context, String routeName,
      {Object? arguments}) {
    Navigator.pushNamed(context, routeName, arguments: arguments);
  }

  static void replace(BuildContext context, String routeName,
      {Object? arguments}) {
    Navigator.pushReplacementNamed(context, routeName, arguments: arguments);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}
