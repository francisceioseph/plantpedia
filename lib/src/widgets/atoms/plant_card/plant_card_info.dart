import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_model.dart';

class PlantCardInfo extends StatelessWidget {
  final PlantModel plant;

  PlantCardInfo({@required this.plant});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8, left: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  plant.scientificName,
                  style: Theme.of(context).primaryTextTheme.title.copyWith(
                        fontFamily: 'JosefinSans',
                        fontSize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 8),
                  child: Text(
                    plant.commonName,
                    style: Theme.of(context).primaryTextTheme.body1.copyWith(
                          fontFamily: 'JosefinSans',
                          fontSize: 20,
                        ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
