import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_grid_view_model.dart';
import 'package:plantpedia/src/redux/actions/species_actions.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/redux/store.dart';

class SpeciesGridConnector extends StatefulWidget {
  final Widget Function(BuildContext, SpeciesGridViewModel) builder;

  SpeciesGridConnector({
    Key key,
    @required this.builder,
  }) : super(key: key);

  @override
  _SpeciesGridConnectorState createState() {
    store.dispatch(GetSpeciesIds());
    return _SpeciesGridConnectorState(builder: this.builder);
  }
}

class _SpeciesGridConnectorState extends State<SpeciesGridConnector> {
  final Widget Function(BuildContext, SpeciesGridViewModel) builder;

  _SpeciesGridConnectorState({
    @required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SpeciesGridViewModel>(
      converter: (store) => SpeciesGridViewModel.build(store),
      builder: this.builder,
    );
  }
}
