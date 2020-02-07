import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_model.dart';

class SpeciesDetailsTitle extends StatelessWidget {
  final SpeciesModel species;

  SpeciesDetailsTitle({this.species});

  @override
  Widget build(BuildContext context) {
    final bottomBorderRadius = this.species.commonName.isEmpty ? 4.0 : 0.0;
    return Container(
      padding: EdgeInsets.only(
        right: 10,
        left: 5,
        top: 2,
        bottom: 2,
      ),
      child: Text(
        species.scientificName,
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
