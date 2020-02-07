import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/redux/store.dart';
import 'package:plantpedia/src/routes.dart';
import 'package:plantpedia/src/themes.dart';
import 'package:plantpedia/src/utils/app_localizations.dart';
import 'package:plantpedia/src/widgets/pages/login_page/login_page.dart';

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
        initialRoute: LoginPage.routeName,
        onGenerateRoute: _router.builder,
        supportedLocales: [
          Locale('en', 'US'),
          Locale('pt', 'BR'),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
      ),
    );
  }
}
