import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_model.dart';

class PlantTitle extends StatelessWidget {
  final PlantModel plant;

  PlantTitle({this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 5,
        left: 5,
        top: 2,
        bottom: 2,
      ),
      child: Text(
        plant.scientificName,
        style: Theme.of(context).primaryTextTheme.title.copyWith(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor.withOpacity(0.95),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(4),
          topRight: Radius.circular(4),
        ),
      ),
    );
  }
}
