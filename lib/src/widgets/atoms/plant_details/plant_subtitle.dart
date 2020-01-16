import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_model.dart';

class PlantSubtitle extends StatelessWidget {
  final PlantModel plant;

  PlantSubtitle({this.plant});

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
        plant.commonName,
        style: Theme.of(context).primaryTextTheme.body1.copyWith(
              fontSize: 28,
            ),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor.withOpacity(0.95),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(4),
          bottomRight: Radius.circular(4),
        ),
      ),
    );
  }
}
