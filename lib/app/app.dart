import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {


   MyApp._internal();
  static final MyApp _instant =
      MyApp._internal(); //singleton or single instance

  factory MyApp() => _instant; // factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

