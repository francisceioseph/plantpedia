import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_model.dart';
import 'package:plantpedia/src/widgets/placeholder_image/placeholder_image.dart';

class SpeciesGridCardImage extends StatelessWidget {
  final SpeciesModel species;

  SpeciesGridCardImage({@required this.species});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 8,
      ),
      child: Hero(
        tag: 'plant-image-${species.id}',
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
