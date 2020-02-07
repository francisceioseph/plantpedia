import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_view_model.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';

class SpeciesConnector extends StatelessWidget {
  final Widget Function(BuildContext, SpeciesViewModel) builder;

  SpeciesConnector({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SpeciesViewModel>(
      converter: (store) => SpeciesViewModel.build(store),
      builder: this.builder,
    );
  }
}
