import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/app/presentation/screens/subcategories/subcategories.dart';
import '../../features/app/presentation/viewmodels/subcategory/subcategory_cubit.dart';
import '../../features/auth/presentation/screens/login/login.dart';
import '../../features/auth/presentation/screens/register/register.dart';
import '../../features/auth/presentation/screens/forget_password/forget_password.dart';
import '../../navigation/main_screen.dart';
import '../di/di.dart';
import 'routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.forgetPassword:return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      case Routes.main:return MaterialPageRoute(builder: (_) => const MainScreen());

      case Routes.subCategories:
        final categoryId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => sl<SubcategoryCubit>()..fetchSubcategories(categoryId),
            child: SubcategoriesScreen(categoryId: categoryId),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
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
