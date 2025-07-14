import 'package:advanced_app/presentation/resources/route_manager.dart';
import 'package:flutter/material.dart';

import '../presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static final MyApp _instant =
      MyApp._internal(); //singleton or single instance

  factory MyApp() => _instant; // factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      onGenerateRoute: RouteGenerator.getRout,
      initialRoute: RouteName.splashRoute,
    );
  }
}
