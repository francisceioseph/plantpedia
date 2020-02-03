import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_model.dart';
import 'package:plantpedia/src/widgets/atoms/placeholder_image.dart';

class PlantCardImage extends StatelessWidget {
  final PlantModel plant;

  PlantCardImage({@required this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 8,
      ),
      child: Hero(
        tag: 'plant-image-${plant.id}',
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          child: _renderImage(),
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
