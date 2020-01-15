import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/plant_model.dart';
import 'package:plantpedia/src/redux/actions/plants_actions.dart';
import 'package:plantpedia/src/redux/store.dart';
import 'package:plantpedia/src/widgets/atoms/plant_card/plant_card_image.dart';
import 'package:plantpedia/src/widgets/atoms/plant_card/plant_card_info.dart';
import 'package:plantpedia/src/widgets/pages/plant_detail_page.dart';

class PlantCard extends StatelessWidget {
  final PlantModel plant;

  PlantCard({@required this.plant});

  @override
  Widget build(BuildContext context) {
    if (plant == null) {
      return Container(
        width: 200,
        height: 200,
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _onPlantTap(context),
      child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            PlantCardImage(
              plant: plant,
            ),
            PlantCardInfo(
              plant: plant,
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
    );
  }

  _onPlantTap(BuildContext context) {
    store.dispatch(SelectPlant(plant: plant));
    Navigator.of(context).pushNamed(PlantDetailPage.routeName);
  }
}
