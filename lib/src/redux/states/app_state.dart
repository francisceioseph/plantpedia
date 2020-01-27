import 'package:flutter/material.dart';
import 'package:plantpedia/src/redux/states/auth_state.dart';
import 'package:plantpedia/src/redux/states/plant_state.dart';

class AppState {
  final PlantState plantState;
  final AuthState authState;

  AppState({
    @required this.plantState,
    @required this.authState,
  });

  factory AppState.initial() => AppState(
        plantState: PlantState.initialState(),
        authState: AuthState.initialState(),
      );

  AppState copy({
    PlantState plantState,
    AuthState authState,
  }) {
    return AppState(
      plantState: plantState ?? this.plantState,
      authState: authState ?? this.authState,
    );
  }
}
