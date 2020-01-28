import 'package:flutter/material.dart';
import 'package:plantpedia/src/redux/store.dart';
import 'package:plantpedia/src/widgets/pages/plant_detail_page.dart';
import 'package:plantpedia/src/widgets/pages/plants_page.dart';
import 'package:plantpedia/src/widgets/pages/login_page.dart';
import 'package:plantpedia/src/widgets/pages/RegisterPage.dart';

class AppRouter {
  MaterialPageRoute builder(RouteSettings settings) {
    String token = store.state.authState.token;

    if (token.length == 0) {
      return _unprotectedRoutes(settings);
    }

    return _protectedRoutes(settings);
  }

  MaterialPageRoute _unprotectedRoutes(RouteSettings settings) {
    if (settings.name == LoginPage.routeName) {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return LoginPage();
        },
      );
    }

    return MaterialPageRoute(
      builder: (BuildContext context) {
        return RegisterPage();
      },
    );
  }

  MaterialPageRoute _protectedRoutes(RouteSettings settings) {
    if (settings.name == PlantDetailPage.routeName) {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return PlantDetailPage();
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
