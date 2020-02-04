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
        duration: Duration(
          milliseconds: 400,
        ),
        height: _height,
        padding: EdgeInsets.only(
          right: 16,
          left: 16,
        ),
        alignment: Alignment.topCenter,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
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
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails details) {
        _setHeightForDragDirection(details.localPosition.dy);
      },
      child: IconButton(
        icon: Icon(
          isExpanded
              ? FontAwesomeIcons.chevronDown
              : FontAwesomeIcons.chevronUp,
          color: Colors.grey[400],
        ),
        splashColor: Colors.blue,
        onPressed: () {
          final double newHeight =
              (isExpanded) ? this.minHeight : this.maxHeight;

          setState(() {
            _height = newHeight;
          });
        },
      ),
    );
  }

  Widget _renderDescriptionTitle() {
    final textStyle = Theme.of(context).primaryTextTheme.title.copyWith(
          fontFamily: 'JosefinSans',
          fontSize: 21,
          fontWeight: FontWeight.bold,
        );

    return Text(
      'About this plant',
      style: textStyle,
    );
  }

  Widget _renderHtmlDescription() {
    return Html(
      customTextAlign: (node) => TextAlign.justify,
      customTextStyle: (node, style) =>
          Theme.of(context).primaryTextTheme.body1.copyWith(
                fontSize: 18,
              ),
      data: widget.plant.description,
    );
  }

  get appBarHeight {
    return AppBar().preferredSize.height;
  }

  get screenHeight {
    return MediaQuery.of(context).size.height;
  }

  double get minHeight => 200.0;

  double get maxHeight => this.screenHeight - this.appBarHeight - 36.0;

  void _setHeightForDragDirection(double dy) {
    setState(() {
      if (dy < 0) {
        _height = maxHeight;
      } else {
        _height = minHeight;
      }
    });
  }
}
