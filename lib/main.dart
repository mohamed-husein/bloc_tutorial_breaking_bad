import 'package:bloc_tutorial/core/app_routes/app_routes.dart';
import 'package:bloc_tutorial/core/services/injection_container.dart' as di;
import 'package:bloc_tutorial/core/utils/app_strings/app_strings.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    MyApp(
      appRouters: AppRouters(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.appRouters,
  }) : super(key: key);

  final AppRouters appRouters;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouters.generateRoute,
    );
  }
}
