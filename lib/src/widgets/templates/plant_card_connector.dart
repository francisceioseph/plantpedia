import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_model.dart';
import 'package:plantpedia/src/models/species_grid_view_model.dart';
import 'package:plantpedia/src/redux/actions/species_actions.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/redux/store.dart';
import 'package:plantpedia/src/widgets/molecules/plant_card.dart';

class PlantCardConnector extends StatelessWidget {
  final SpeciesModel plant;

  PlantCardConnector({@required this.plant});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SpeciesGridViewModel>(
      converter: (store) => SpeciesGridViewModel.build(store),
      builder: (BuildContext context, SpeciesGridViewModel props) {
        final plantWithImage = props.speciesMap[plant.id.toString()];

        if (plantWithImage == null) {
          store.dispatch(GetSpecies(specie: plant));
        }

        return PlantCard(plant: plantWithImage);
      },
    );
  }
}
