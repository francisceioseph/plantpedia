import 'package:async_redux/async_redux.dart';
import 'package:plantpedia/src/models/plant_model.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';

class PlantsViewModel {
  final Map<String, PlantModel> basicPlants;
  final Map<String, PlantModel> plants;

  PlantsViewModel({this.basicPlants, this.plants});

  factory PlantsViewModel.build(Store<AppState> store) {
    Map<String, PlantModel> basicPlants = store.state.plantState.basicPlants;
    Map<String, PlantModel> plants = store.state.plantState.plants;

    return PlantsViewModel(
      basicPlants: basicPlants,
      plants: plants,
    );
  }
}
