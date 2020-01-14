import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plants_view_model.dart';
import 'package:plantpedia/src/redux/actions/plants_actions.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/redux/store.dart';
import 'package:plantpedia/src/widgets/molecules/plant_grid/plant_grid.dart';

class PlantsConnector extends StatefulWidget {
  PlantsConnector({Key key}) : super(key: key);

  @override
  _PlantsConnectorState createState() {
    store.dispatch(RetrievePlants());

    return _PlantsConnectorState();
  }
}

class _PlantsConnectorState extends State<PlantsConnector> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PlantsViewModel>(
      converter: (store) => PlantsViewModel.build(store),
      builder: (BuildContext context, PlantsViewModel props) {
        return PlantGrid(
          plants: props.plants,
        );
      },
    );
  }
}
