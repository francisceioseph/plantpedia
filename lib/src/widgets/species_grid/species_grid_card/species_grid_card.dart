import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_model.dart';
import 'package:plantpedia/src/redux/actions/species_actions.dart';
import 'package:plantpedia/src/redux/store.dart';
import 'package:plantpedia/src/widgets/species_grid/species_grid_card/species_grid_card_image.dart';
import 'package:plantpedia/src/widgets/species_grid/species_grid_card/species_grid_card_info.dart';
import 'package:plantpedia/src/widgets/pages/species_details_page/species_detail_page.dart';

class SpeciesGridCard extends StatelessWidget {
  final SpeciesModel species;

  SpeciesGridCard({@required this.species});

  @override
  Widget build(BuildContext context) {
    if (species == null) {
      return Container(
        width: 200,
        height: 200,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _onPlantTap(context),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SpeciesGridCardImage(
              species: species,
            ),
            SpeciesGridCardInfo(
              species: species,
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
    );
  }

  _onPlantTap(BuildContext context) {
    store.dispatch(SelectSpecies(species: species));
    Navigator.of(context).pushNamed(SpeciesDetailsPage.routeName);
  }
}
