import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_model.dart';
import 'package:plantpedia/src/models/species_grid_view_model.dart';
import 'package:plantpedia/src/redux/actions/species_actions.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/redux/store.dart';

class SpeciesGridCardConnector extends StatelessWidget {
  final SpeciesModel species;
  final Widget Function(BuildContext, SpeciesModel) builder;

  SpeciesGridCardConnector({
    @required this.species,
    @required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SpeciesGridViewModel>(
      converter: (store) => SpeciesGridViewModel.build(store),
      builder: (BuildContext context, SpeciesGridViewModel props) {
        final speciesWithImage = props.speciesMap[species.id.toString()];

        if (speciesWithImage == null) {
          store.dispatch(GetSpecies(specie: species));
        }

        return this.builder(context, speciesWithImage);
      },
    );
  }
}
