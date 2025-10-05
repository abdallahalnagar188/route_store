import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'app.dart';
import 'core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const MyApp());
}
