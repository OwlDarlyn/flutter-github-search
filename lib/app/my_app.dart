import 'package:flutter/material.dart';

import 'package:potje_test_assignment/presentation/resources/routes_manager.dart';
import 'package:potje_test_assignment/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();
  int appState = 0;

  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
