import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_model.dart';

class PlantTitle extends StatelessWidget {
  final PlantModel plant;

  PlantTitle({this.plant});

  @override
  Widget build(BuildContext context) {
    return Text(
      plant.scientificName,
      style: Theme.of(context).primaryTextTheme.title.copyWith(
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
