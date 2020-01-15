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
          child: _renderImage(),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  _renderImage() {
    if (plant.images.isEmpty) {
      return Image.asset('assets/images/placeholder.jpg');
    }

    return FadeInImage.assetNetwork(
      fadeInDuration: Duration(milliseconds: 200),
      fadeOutDuration: Duration(milliseconds: 200),
      placeholder: 'assets/images/placeholder.jpg',
      image: plant.images[0].url,
    );
  }
}
