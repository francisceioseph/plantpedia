import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:async_redux/async_redux.dart';
import 'package:plantpedia/src/redux/actions/loading_actions.dart';
import 'package:plantpedia/src/redux/actions/navigation_actions.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/redux/states/auth_state.dart';
import 'package:plantpedia/src/repositories/auth_repository.dart';

class Login extends ReduxAction<AppState> {
  final String username;
  final String password;
  final BuildContext context;

  Login({
    this.username,
    this.password,
    this.context,
  }) : assert(username != null && password != null && context != null);

  Future<AppState> reduce() async {
    store.dispatch(StartLoading(
      context: context,
    ));

    try {
      final res = await AuthRepository.login(username, password);
      final body = json.decode(res.body);
      final token = res.headers['authorization'];

      if (token == null) {
        throw (body['error']);
      } else {
        store.dispatch(LoginSuccess(
          token: token,
          user: body,
        ));
        store.dispatch(StopLoading(context: context));
        store.dispatch(NavigateToRoot(context: context));
      }
    } catch (e) {
      store.dispatch(StopLoading(context: context));
      store.dispatch(LoginError(context: context));
    }

    return null;
  }
}

class LoginSuccess extends ReduxAction<AppState> {
  final String token;
  final dynamic user;

  LoginSuccess({this.token, this.user});

  AppState reduce() {
    final AuthState authState = state.authState.copy(
      token: token,
      user: user,
    );

    return state.copy(authState: authState);
  }
}

class LoginError extends ReduxAction<AppState> {
  BuildContext context;

  LoginError({@required this.context});

  AppState reduce() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(
              'Cannot login. Please, check your credentials and try again later',
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    return null;
  }
}
