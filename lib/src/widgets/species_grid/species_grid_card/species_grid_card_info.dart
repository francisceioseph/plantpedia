import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_model.dart';

class SpeciesGridCardInfo extends StatelessWidget {
  final SpeciesModel species;

  SpeciesGridCardInfo({@required this.species});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8, left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  species.scientificName,
                  style: Theme.of(context).primaryTextTheme.title.copyWith(
                        fontFamily: 'JosefinSans',
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    species.commonName,
                    style: Theme.of(context).primaryTextTheme.subtitle.copyWith(
                          fontFamily: 'JosefinSans',
                          fontSize: 20,
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
