import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_model.dart';

class PlantSubtitle extends StatelessWidget {
  final PlantModel plant;

  PlantSubtitle({this.plant});

  @override
  Widget build(BuildContext context) {
    return Text(
      plant.commonName,
      style: Theme.of(context)
          .primaryTextTheme
          .title
          .copyWith(fontSize: 32, fontWeight: FontWeight.w200),
    );
  }
}
