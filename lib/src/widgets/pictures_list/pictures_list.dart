import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/image_model.dart';
import 'package:plantpedia/src/widgets/thumbnail/thumbnail.dart';

class PicturesList extends StatelessWidget {
  final List<ImageModel> images;

  PicturesList({
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
