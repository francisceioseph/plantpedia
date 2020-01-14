import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plantpedia/src/models/plant_model.dart';
import 'package:plantpedia/src/widgets/molecules/plant_card.dart';

class PlantGrid extends StatelessWidget {
  final List<PlantModel> plants;

  PlantGrid({@required this.plants});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverStaggeredGrid.countBuilder(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: plants.length,
            itemBuilder: (BuildContext context, int index) {
              return PlantCard(plant: plants[index]);
            },
            staggeredTileBuilder: (int index) {
              return StaggeredTile.fit(2);
            },
          ),
        ],
      ),
    );
  }
}
