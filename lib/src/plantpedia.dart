import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/redux/store.dart';
import 'package:plantpedia/src/routes.dart';
import 'package:plantpedia/src/themes.dart';

class PlantPedia extends StatelessWidget {
  final AppRouter _router = AppRouter();
  final Store<AppState> _store = store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: _store,
      child: MaterialApp(
        title: 'PlantPedia',
        theme: kLightTheme,
        darkTheme: kDarkTheme,
        initialRoute: '/',
        onGenerateRoute: _router.builder,
      ),
    );
  }
}
