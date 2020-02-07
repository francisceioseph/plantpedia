import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_grid_view_model.dart';
import 'package:plantpedia/src/widgets/organisms/plant_grid.dart';
import 'package:plantpedia/src/widgets/templates/species_grid_connector.dart';

class PlantsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      child: Center(
        child: SpeciesGridConnector(
          builder: (BuildContext context, SpeciesGridViewModel props) {
            return PlantGrid(
              plants: props.speciesIds.values.toList(),
            );
          },
        ),
      ),
    );
  }
}
