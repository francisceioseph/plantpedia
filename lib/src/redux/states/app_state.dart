import 'package:flutter/material.dart';
import 'package:plantpedia/src/redux/states/plant_state.dart';

class AppState {
  final PlantState plantState;

  AppState({
    @required this.plantState,
  });

  factory AppState.initial() => AppState(
        plantState: PlantState.initialState(),
      );

  AppState copy({
    PlantState plantState,
  }) {
    return AppState(
      plantState: plantState ?? this.plantState,
    );
  }
}
