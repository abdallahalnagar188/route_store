import 'package:flutter/material.dart';
import 'app.dart';
import 'core/di/di.dart';
import 'core/local/cash_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await CacheHelper.init();
  runApp(const MyApp());
}
