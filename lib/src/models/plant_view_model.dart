import 'package:async_redux/async_redux.dart';
import 'package:plantpedia/src/models/plant_model.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';

class PlantViewModel {
  final PlantModel plant;

  PlantViewModel(this.plant);

  factory PlantViewModel.build(Store<AppState> store) {
    PlantModel plant = store.state.plantState.plant;
    return PlantViewModel(plant);
  }
}
