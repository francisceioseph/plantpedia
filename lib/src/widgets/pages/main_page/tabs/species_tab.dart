import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_grid_view_model.dart';
import 'package:plantpedia/src/widgets/species_grid/species_grid.dart';
import 'package:plantpedia/src/widgets/connectors/species_grid_connector.dart';

class SpeciesTab extends StatelessWidget {
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
            return SpeciesGrid(
              species: props.speciesIds.values.toList(),
            );
          },
        ),
      ),
    );
  }
}
