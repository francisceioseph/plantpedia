import 'package:async_redux/async_redux.dart';
import 'package:plantpedia/src/models/species_model.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';

class SpeciesViewModel {
  final SpeciesModel species;

  SpeciesViewModel(this.species);

  factory SpeciesViewModel.build(Store<AppState> store) {
    SpeciesModel plant = store.state.speciesState.plant;
    return SpeciesViewModel(plant);
  }
}
