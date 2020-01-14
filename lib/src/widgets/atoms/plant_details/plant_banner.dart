import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_model.dart';

class PlantBanner extends StatelessWidget {
  final PlantModel plant;

  PlantBanner({this.plant});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      width: MediaQuery.of(context).size.width,
      child: Hero(
        tag: 'plant-image-${plant.id}',
        child: FittedBox(
          child: Image.network(plant.images[0].url),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
