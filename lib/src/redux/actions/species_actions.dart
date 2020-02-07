import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:plantpedia/src/models/species_model.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/repositories/plant_repository.dart';

class GetSpeciesIds extends ReduxAction<AppState> {
  Future<AppState> reduce() async {
    final response = await PlantRepository.getPlants();
    final body = json.decode(response.body);
    final List<SpeciesModel> species = body
        .cast<Map<String, dynamic>>()
        .map((Map<String, dynamic> p) => SpeciesModel.fromJson(p))
        .toList()
        .cast<SpeciesModel>();

    store.dispatch(GetSpeciesIdsSuccess(species: species));

    return null;
  }
}

class GetSpeciesIdsSuccess extends ReduxAction<AppState> {
  final List<SpeciesModel> species;

  GetSpeciesIdsSuccess({this.species}) : assert(species != null);

  AppState reduce() {
    final speciesIds = species.fold(<String, SpeciesModel>{},
        (Map<String, SpeciesModel> acc, SpeciesModel p) {
      acc['${p.id}'] = p;
      return acc;
    }).cast<String, SpeciesModel>();

    final plantState = state.speciesState.copy(speciesIds: speciesIds);
    return state.copy(speciesState: plantState);
  }
}

class GetSpecies extends ReduxAction<AppState> {
  final SpeciesModel specie;

  GetSpecies({this.specie}) : assert(specie != null);

  Future<AppState> reduce() async {
    final response = await PlantRepository.getPlant(this.specie.id);
    final body = json.decode(response.body);

    try {
      final specie = SpeciesModel.fromJson(body);
      store.dispatch(GetSpeciesSuccess(specie: specie));
    } catch (e) {
      print(e);
    }

    return null;
  }
}

class GetSpeciesSuccess extends ReduxAction<AppState> {
  final SpeciesModel specie;

  GetSpeciesSuccess({this.specie}) : assert(specie != null);

  AppState reduce() {
    final Map<String, SpeciesModel> speciesMap = Map<String, SpeciesModel>();

    speciesMap.addAll(state.speciesState.species);
    speciesMap['${specie.id}'] = specie;

    final plantState = state.speciesState.copy(
      speciesMap: speciesMap,
    );

    return state.copy(speciesState: plantState);
  }
}

class SelectSpecies extends ReduxAction<AppState> {
  final SpeciesModel species;

  SelectSpecies({this.species}) : assert(species != null);

  AppState reduce() {
    final plantState = state.speciesState.copy(plant: species);
    return state.copy(speciesState: plantState);
  }
}
