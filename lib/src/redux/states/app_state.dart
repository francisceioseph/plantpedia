import 'package:flutter/material.dart';
import 'package:plantpedia/src/redux/states/auth_state.dart';
import 'package:plantpedia/src/redux/states/species_state.dart';

class AppState {
  final SpeciesState speciesState;
  final AuthState authState;

  AppState({
    @required this.speciesState,
    @required this.authState,
  });

  factory AppState.initial() => AppState(
        speciesState: SpeciesState.initialState(),
        authState: AuthState.initialState(),
      );

  AppState copy({
    SpeciesState speciesState,
    AuthState authState,
  }) {
    return AppState(
      speciesState: speciesState ?? this.speciesState,
      authState: authState ?? this.authState,
    );
  }
}
