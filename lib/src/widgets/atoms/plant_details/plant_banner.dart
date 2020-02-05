import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_model.dart';
import 'package:plantpedia/src/widgets/atoms/placeholder_image.dart';

class PlantBanner extends StatelessWidget {
  final PlantModel plant;

  PlantBanner({this.plant});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Hero(
        tag: 'plant-image-${plant.id}',
        child: FittedBox(
          child: _renderImage(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _renderImage() {
    if (plant.images.isEmpty) {
      return PlaceholderImage();
    }

    final imageUrl = plant.images.first.url;

    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => PlaceholderImage(),
      errorWidget: (context, url, error) => PlaceholderImage(),
    );
  }
}
