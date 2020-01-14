import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_model.dart';

class PlantCard extends StatelessWidget {
  final PlantModel plant;

  PlantCard({@required this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _renderPlantImage(context),
          _renderPlantInfo(context),
        ],
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
    );
  }

  Widget _renderPlantImage(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        padding: EdgeInsets.all(4),
        child: Image.network(
          plant.images[0].url,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _renderPlantInfo(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8, left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                plant.commonName,
                style: Theme.of(context)
                    .primaryTextTheme
                    .title
                    .copyWith(fontSize: 22),
              ),
              Text(
                plant.scientificName,
                style: Theme.of(context)
                    .primaryTextTheme
                    .body1
                    .copyWith(fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }
}
