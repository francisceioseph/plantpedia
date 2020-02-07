import 'package:flutter/material.dart';
import 'package:plantpedia/src/redux/store.dart';
import 'package:plantpedia/src/widgets/pages/main_page/main_page.dart';
import 'package:plantpedia/src/widgets/pages/species_details_page/species_detail_page.dart';
import 'package:plantpedia/src/widgets/pages/login_page/login_page.dart';
import 'package:plantpedia/src/widgets/pages/register_page/register_page.dart';

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
    if (settings.name == SpeciesDetailsPage.routeName) {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return SpeciesDetailsPage();
        },
      );
    }

    return MaterialPageRoute(
      builder: (BuildContext context) {
        return MainPage();
      },
    );
  }
}
