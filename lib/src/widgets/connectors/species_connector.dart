import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_view_model.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/widgets/species_details/species_details.dart';

class SpeciesConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SpeciesViewModel>(
      converter: (store) => SpeciesViewModel.build(store),
      builder: (BuildContext context, SpeciesViewModel props) {
        return SpeciesDetails(
          species: props.species,
        );
      },
    );
  }
}
