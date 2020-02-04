import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/auth_view_model.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';

class AuthConnector extends StatelessWidget {
  final Widget Function(BuildContext, AuthViewModel) builder;

  AuthConnector({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AuthViewModel>(
      converter: (store) => AuthViewModel.build(store),
      builder: this.builder,
    );
  }
}
