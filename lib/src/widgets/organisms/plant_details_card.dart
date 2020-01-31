import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantpedia/src/models/plant_model.dart';

class PlantDetailsCard extends StatefulWidget {
  final PlantModel plant;

  PlantDetailsCard({this.plant});

  @override
  _PlantDetailsCardState createState() => _PlantDetailsCardState();
}

class _PlantDetailsCardState extends State<PlantDetailsCard> {
  double _height = 200;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        height: _height,
        padding: EdgeInsets.only(
          right: 16,
          left: 16,
        ),
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: ListView(
          children: <Widget>[
            _renderUpDownButton(),
            _renderDescriptionTitle(),
            _renderHtmlDescription()
          ],
        ),
      ),
    );
  }

  get isExpanded => _height > 200;

  Widget _renderUpDownButton() {
    return IconButton(
      icon: Icon(
        isExpanded ? FontAwesomeIcons.chevronDown : FontAwesomeIcons.chevronUp,
        color: Colors.grey[400],
      ),
      splashColor: Colors.blue,
      onPressed: () {
        final appBarHeight = AppBar().preferredSize.height;
        final screenHeight = MediaQuery.of(context).size.height;

        final double newHeight =
            (isExpanded) ? 200 : screenHeight - appBarHeight - 24;

        setState(() {
          _height = newHeight;
        });
      },
    );
  }

  Widget _renderDescriptionTitle() {
    final textStyle = Theme.of(context)
        .primaryTextTheme
        .title
        .copyWith(fontWeight: FontWeight.bold);

    return Text(
      'About this plant',
      style: textStyle,
    );
  }

  Widget _renderHtmlDescription() {
    return Html(
      data: widget.plant.description,
    );
  }
}
