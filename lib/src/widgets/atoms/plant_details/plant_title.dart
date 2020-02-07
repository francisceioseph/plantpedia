import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_model.dart';

class PlantTitle extends StatelessWidget {
  final SpeciesModel plant;

  PlantTitle({this.plant});

  @override
  Widget build(BuildContext context) {
    final bottomBorderRadius = this.plant.commonName.isEmpty ? 4.0 : 0.0;
    return Container(
      padding: EdgeInsets.only(
        right: 10,
        left: 5,
        top: 2,
        bottom: 2,
      ),
      child: Text(
        plant.scientificName,
        style: Theme.of(context).primaryTextTheme.title.copyWith(
              fontFamily: 'JosefinSans',
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor.withOpacity(0.95),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
          bottomLeft: Radius.circular(bottomBorderRadius),
          bottomRight: Radius.circular(bottomBorderRadius),
        ),
      ),
    );
  }
}
