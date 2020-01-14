import 'package:flutter/material.dart';
import 'package:plantpedia/src/widgets/pages/plants_page.dart';
import 'package:plantpedia/src/widgets/pages/login_page.dart';
import 'package:plantpedia/src/widgets/pages/RegisterPage.dart';

class AppRouter {
  MaterialPageRoute builder(RouteSettings settings) {
    if (settings.name == LoginPage.routeName) {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return LoginPage();
        },
      );
    }

    if (settings.name == RegisterPage.routeName) {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return RegisterPage();
        },
      );
    }

    return MaterialPageRoute(
      builder: (BuildContext context) {
        return PlantsPage();
      },
    );
  }
}
