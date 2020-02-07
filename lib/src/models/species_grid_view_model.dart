import 'package:async_redux/async_redux.dart';
import 'package:plantpedia/src/models/species_model.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';

class SpeciesGridViewModel {
  final Map<String, SpeciesModel> speciesIds;
  final Map<String, SpeciesModel> speciesMap;

  SpeciesGridViewModel({this.speciesIds, this.speciesMap});

  factory SpeciesGridViewModel.build(Store<AppState> store) {
    Map<String, SpeciesModel> basicPlants = store.state.speciesState.speciesIds;
    Map<String, SpeciesModel> plants = store.state.speciesState.speciesMap;

    return SpeciesGridViewModel(
      speciesIds: basicPlants,
      speciesMap: plants,
    );
  }
}
