import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:plantpedia/src/models/plant_model.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/repositories/plant_repository.dart';

class RetrievePlants extends ReduxAction<AppState> {
  Future<AppState> reduce() async {
    final response = await PlantRepository.getPlants();
    final body = json.decode(response.body);
    final List<PlantModel> plants = body
        .cast<Map<String, dynamic>>()
        .map((Map<String, dynamic> p) => PlantModel.fromJson(p))
        .toList()
        .cast<PlantModel>();

    store.dispatch(RetrievePlantsSuccess(plants: plants));

    return null;
  }
}

class RetrievePlantsSuccess extends ReduxAction<AppState> {
  final List<PlantModel> plants;

  RetrievePlantsSuccess({this.plants}) : assert(plants != null);

  AppState reduce() {
    final plantMap = plants.fold(<String, PlantModel>{},
        (Map<String, PlantModel> acc, PlantModel p) {
      acc['${p.id}'] = p;
      return acc;
    }).cast<String, PlantModel>();

    final plantState = state.plantState.copy(basicPlants: plantMap);
    return state.copy(plantState: plantState);
  }
}

class RetrievePlant extends ReduxAction<AppState> {
  final PlantModel plant;

  RetrievePlant({this.plant}) : assert(plant != null);

  Future<AppState> reduce() async {
    final response = await PlantRepository.getPlant(this.plant.id);
    final body = json.decode(response.body);

    try {
      final plant = PlantModel.fromJson(body);
      store.dispatch(RetrievePlantSuccess(plant: plant));
    } catch (e) {
      print(e);
    }

    return null;
  }
}

class RetrievePlantSuccess extends ReduxAction<AppState> {
  final PlantModel plant;

  RetrievePlantSuccess({this.plant}) : assert(plant != null);

  AppState reduce() {
    final Map<String, PlantModel> plants = Map<String, PlantModel>();

    plants.addAll(state.plantState.plants);
    plants['${plant.id}'] = plant;

    final plantState = state.plantState.copy(
      plants: plants,
    );

    return state.copy(plantState: plantState);
  }
}

class SelectPlant extends ReduxAction<AppState> {
  final PlantModel plant;

  SelectPlant({this.plant}) : assert(plant != null);

  AppState reduce() {
    final plantState = state.plantState.copy(plant: plant);
    return state.copy(plantState: plantState);
  }
}
