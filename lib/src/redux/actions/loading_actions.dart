import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/widgets/loading_dialog/loading_dialog.dart';

class StartLoading extends ReduxAction<AppState> {
  final BuildContext context;

  StartLoading({this.context});

  AppState reduce() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingDialog();
      },
    );

    return null;
  }
}

class StopLoading extends ReduxAction<AppState> {
  final BuildContext context;

  StopLoading({this.context});

  AppState reduce() {
    Navigator.of(context).pop();
    return null;
  }
}
