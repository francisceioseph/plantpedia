import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plantpedia/src/models/species_model.dart';
import 'package:plantpedia/src/widgets/species_grid/species_grid_card/species_grid_card.dart';
import 'package:plantpedia/src/widgets/connectors/species_grid_card_connector.dart';

class SpeciesGrid extends StatelessWidget {
  final List<SpeciesModel> species;

  SpeciesGrid({@required this.species});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverStaggeredGrid.countBuilder(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: species.length,
            itemBuilder: (BuildContext context, int index) {
              return SpeciesGridCardConnector(
                species: species[index],
                builder: (BuildContext context, SpeciesModel species) {
                  return SpeciesGridCard(species: species);
                },
              );
            },
            staggeredTileBuilder: (int index) {
              return StaggeredTile.fit(2);
            },
          ),
        ],
      ),
    );
  }
}
