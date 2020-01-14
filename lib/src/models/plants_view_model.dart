import 'package:async_redux/async_redux.dart';
import 'package:plantpedia/src/models/plant_model.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';

class PlantsViewModel {
  final List<PlantModel> plants;

  PlantsViewModel(this.plants);

  factory PlantsViewModel.build(Store<AppState> store) {
    List<PlantModel> plants = store.state.plantState.plants;
    return PlantsViewModel(plants);
  }
}
