import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_model.dart';
import 'package:plantpedia/src/models/plants_view_model.dart';
import 'package:plantpedia/src/redux/actions/plants_actions.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/redux/store.dart';
import 'package:plantpedia/src/widgets/molecules/plant_card.dart';

class PlantCardConnector extends StatelessWidget {
  final PlantModel plant;

  PlantCardConnector({@required this.plant});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PlantsViewModel>(
      converter: (store) => PlantsViewModel.build(store),
      builder: (BuildContext context, PlantsViewModel props) {
        final plantWithImage = props.plants[plant.id.toString()];

        if (plantWithImage == null) {
          store.dispatch(RetrievePlant(plant: plant));
        }

        return PlantCard(plant: plantWithImage);
      },
    );
  }
}
