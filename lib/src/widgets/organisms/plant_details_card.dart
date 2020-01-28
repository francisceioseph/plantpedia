import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantpedia/src/models/plant_model.dart';

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
      child: Container(
        padding: EdgeInsets.only(
          right: 16,
          left: 16,
        ),
        alignment: Alignment.topCenter,
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: ListView(
          children: <Widget>[
            IconButton(
              icon: Icon(
                FontAwesomeIcons.chevronUp,
                color: Colors.grey[400],
              ),
              onPressed: () {},
            ),
            Text(
              'About this plant',
              style: textStyle,
            ),
            Html(
              data: plant.description,
            )
          ],
        ),
      ),
    );
  }
}
