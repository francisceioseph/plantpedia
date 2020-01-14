import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:plantpedia/src/models/plant_model.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/repositories/plant_repository.dart';

class RetrievePlants extends ReduxAction<AppState> {
  Future<AppState> reduce() async {
    final response = await PlantRepository.getPlants();
    final body = json.decode(response.body);
    final List<PlantModel> plants = body['plants']
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
    final plantState = state.plantState.copy(plants: this.plants);
    return state.copy(plantState: plantState);
  }
}
