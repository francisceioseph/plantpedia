import 'package:flutter/material.dart';
import 'package:plantpedia/src/routes.dart';
import 'package:plantpedia/src/themes.dart';

class PlantPedia extends StatelessWidget {
  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlantPedia',
      theme: kLightTheme,
      darkTheme: kDarkTheme,
      initialRoute: '/login',
      onGenerateRoute: _router.builder,
    );
  }
}
