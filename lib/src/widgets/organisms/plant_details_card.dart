import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_model.dart';
import 'package:plantpedia/src/widgets/atoms/blurred_container.dart';

class PlantDetailsCard extends StatelessWidget {
  final PlantModel plant;

  PlantDetailsCard({this.plant});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context)
        .primaryTextTheme
        .title
        .copyWith(fontWeight: FontWeight.bold);

    return Positioned(
      left: 0,
      bottom: 0,
      child: BlurredContainer(
        height: 200,
        width: MediaQuery.of(context).size.width,
        sigmaX: 0,
        sigmaY: 0,
        color: Colors.white,
        opacity: 1,
        borderRadius: 16,
        child: Container(
          padding: EdgeInsets.all(16),
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'About this plant',
                style: textStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
