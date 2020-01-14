import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_model.dart';
import 'package:plantpedia/src/widgets/atoms/plant_details/plant_banner.dart';
import 'package:plantpedia/src/widgets/atoms/plant_details/plant_subtitle.dart';
import 'package:plantpedia/src/widgets/atoms/plant_details/plant_title.dart';

class PlantDetail extends StatelessWidget {
  final PlantModel plant;

  PlantDetail({this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          PlantBanner(plant: plant),
          Container(
            padding: EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PlantTitle(plant: plant),
                PlantSubtitle(plant: plant),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
