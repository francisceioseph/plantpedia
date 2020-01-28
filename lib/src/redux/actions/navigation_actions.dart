import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/widgets/pages/plants_page.dart';

class NavigateToRoot extends ReduxAction<AppState> {
  final BuildContext context;

  NavigateToRoot({this.context});

  AppState reduce() {
    Navigator.of(context).pushNamedAndRemoveUntil(
      PlantsPage.routeName,
      (_) => false,
    );

    return null;
  }
}
