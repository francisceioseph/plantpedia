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
        store.dispatch(AuthSuccess(
          token: token,
          user: body,
        ));
        store.dispatch(StopLoading(context: context));
        store.dispatch(NavigateToLogin(context: context));
      }
    } catch (e) {
      store.dispatch(StopLoading(context: context));
      store.dispatch(AuthError(context: context));
    }

    return null;
  }
}

class AuthSuccess extends ReduxAction<AppState> {
  final String token;
  final dynamic user;

  AuthSuccess({this.token, this.user});

  AppState reduce() {
    final AuthState authState = state.authState.copy(
      token: token,
      user: user,
    );

    return state.copy(authState: authState);
  }
}

class AuthError extends ReduxAction<AppState> {
  BuildContext context;
  List<String> errors;

  AuthError({
    @required this.context,
    this.errors,
  });

  AppState reduce() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(
              'An unexpected error happened. Please, check your credentials and try again later',
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

class Register extends ReduxAction<AppState> {
  String name;
  String email;
  String password;
  String passwordConfirmation;
  BuildContext context;

  Register({
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.passwordConfirmation,
    @required this.context,
  });

  Future<AppState> reduce() async {
    store.dispatch(StartLoading(context: context));

    try {
      final res = await AuthRepository.register(
        name,
        email,
        password,
        passwordConfirmation,
      );

      final body = json.decode(res.body);

      if (body['id'] == null) {
        throw (body['errors']);
      } else {
        store.dispatch(StopLoading(context: context));
        store.dispatch(
          Login(
            username: email,
            password: password,
            context: context,
          ),
        );
      }
    } catch (e) {
      store.dispatch(StopLoading(context: context));
      store.dispatch(AuthError(context: context, errors: e));
    }

    return null;
  }
}

class Logout extends ReduxAction<AppState> {
  final BuildContext context;

  Logout({this.context});

  Future<AppState> reduce() async {
    store.dispatch(StartLoading(context: context));

    try {
      await AuthRepository.logout();
      store.dispatch(LogoutSuccess());
      store.dispatch(StopLoading(context: context));
      store.dispatch(NavigateToLogin(context: context));
    } catch (e) {
      store.dispatch(LogoutError(context: context));
      store.dispatch(StopLoading(context: context));
    }

    return null;
  }
}

class LogoutSuccess extends ReduxAction<AppState> {
  AppState reduce() {
    final authState = AuthState.initialState();
    return state.copy(authState: authState);
  }
}

class LogoutError extends ReduxAction<AppState> {
  BuildContext context;

  LogoutError({@required this.context});

  AppState reduce() {
    showDialog(
      context: context,
      child: AlertDialog(
        title: Text('Warning'),
        content: Text('Cannot do logout now, please try again later'),
        actions: <Widget>[
          FlatButton(
            child: Text('close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );

    return null;
  }
}
