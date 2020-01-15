import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_model.dart';

class PlantCardImage extends StatelessWidget {
  final PlantModel plant;

  PlantCardImage({@required this.plant});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        padding: EdgeInsets.all(4),
        child: Hero(
          tag: 'plant-image-${plant.id}',
          child: _renderImage(),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
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
