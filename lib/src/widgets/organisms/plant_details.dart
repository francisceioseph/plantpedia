import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_model.dart';
import 'package:plantpedia/src/widgets/atoms/plant_details/plant_banner.dart';
import 'package:plantpedia/src/widgets/atoms/plant_details/plant_subtitle.dart';
import 'package:plantpedia/src/widgets/atoms/plant_details/plant_title.dart';
import 'package:plantpedia/src/widgets/organisms/plant_details_card.dart';
import 'package:plantpedia/src/widgets/organisms/plant_pictures_card.dart';

class PlantDetail extends StatelessWidget {
  final SpeciesModel plant;

  PlantDetail({this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          PlantBanner(plant: plant),
          _renderPlantNames(),
          _renderOtherPictures(),
          PlantDetailsCard(
            plant: plant,
          ),
        ],
      ),
    );
  }

  Widget _renderOtherPictures() {
    if (plant.images.length > 1) {
      return PlantPicturesCard(
        images: plant.images,
      );
    }

    return Container();
  }

  Widget _renderPlantNames() {
    final children = <Widget>[
      PlantTitle(plant: plant),
    ];

    if (plant.commonName.isNotEmpty) {
      children.add(
        PlantSubtitle(plant: plant),
      );
    }

    return Container(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
