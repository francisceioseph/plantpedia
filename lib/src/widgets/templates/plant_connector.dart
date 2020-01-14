import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_view_model.dart';
import 'package:plantpedia/src/redux/states/app_state.dart';
import 'package:plantpedia/src/widgets/organisms/plant_details.dart';

class PlantConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PlantViewModel>(
      converter: (store) => PlantViewModel.build(store),
      builder: (BuildContext context, PlantViewModel props) {
        return PlantDetail(
          plant: props.plant,
        );
      },
    );
  }
}
