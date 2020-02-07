import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_model.dart';
import 'package:plantpedia/src/widgets/placeholder_image/placeholder_image.dart';

class SpeciesDetailsBanner extends StatelessWidget {
  final SpeciesModel species;

  SpeciesDetailsBanner({this.species});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Hero(
        tag: 'plant-image-${species.id}',
        child: FittedBox(
          child: _renderImage(),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  _renderImage() {
    if (species.images.isEmpty) {
      return PlaceholderImage();
    }

    final imageUrl = species.images.first.url;

    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => PlaceholderImage(),
      errorWidget: (context, url, error) => PlaceholderImage(),
    );
  }
}
