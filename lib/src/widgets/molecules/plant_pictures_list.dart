import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_image_model.dart';
import 'package:plantpedia/src/widgets/atoms/thumbnail.dart';

class PlantPicturesList extends StatelessWidget {
  final List<PlantImageModel> images;

  PlantPicturesList({
    this.images = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: GridView.builder(
        itemCount: images.length,
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
        ),
        itemBuilder: (BuildContext context, int index) {
          return NetworkThumbnail(
            imageUrl: images[index].url,
          );
        },
      ),
    );
  }
}
