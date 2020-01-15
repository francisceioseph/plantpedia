import 'package:flutter/material.dart';
import 'package:plantpedia/src/constants.dart';
import 'package:plantpedia/src/models/plant_image_model.dart';
import 'package:plantpedia/src/widgets/atoms/blurred_container.dart';
import 'package:plantpedia/src/widgets/molecules/plant_pictures_list.dart';

class PlantPicturesCard extends StatelessWidget {
  final List<PlantImageModel> images;
  final double height;

  PlantPicturesCard({
    this.images,
    this.height = 350,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).primaryTextTheme.title.copyWith(
          fontWeight: FontWeight.bold,
          color: kAlternateTextColor,
        );

    return Positioned(
      left: 0,
      bottom: 0,
      child: BlurredContainer(
        height: height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        borderRadius: 16,
        child: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'More images',
                style: textStyle,
              ),
              PlantPicturesList(images: images),
            ],
          ),
        ),
      ),
    );
  }
}
