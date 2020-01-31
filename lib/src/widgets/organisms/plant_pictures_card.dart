import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantpedia/src/constants.dart';
import 'package:plantpedia/src/models/plant_image_model.dart';
import 'package:plantpedia/src/widgets/atoms/blur_box.dart';
import 'package:plantpedia/src/widgets/molecules/plant_pictures_list.dart';

class PlantPicturesCard extends StatefulWidget {
  final List<PlantImageModel> images;

  PlantPicturesCard({
    this.images,
  });

  @override
  _PlantPicturesCardState createState() => _PlantPicturesCardState();
}

class _PlantPicturesCardState extends State<PlantPicturesCard> {
  static const double kMinHeight = 370;

  double _height = kMinHeight;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      child: BlurBox(
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
            color: Colors.grey[900].withOpacity(0.75),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: ListView(
            children: <Widget>[
              _renderUpDownButton(),
              _renderCardTitle(),
              PlantPicturesList(
                images: widget.images,
              ),
            ],
          ),
        ),
      ),
    );
  }

  get isExpanded => _height > kMinHeight;

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
            (isExpanded) ? kMinHeight : screenHeight - appBarHeight - 24;

        setState(() {
          _height = newHeight;
        });
      },
    );
  }

  Widget _renderCardTitle() {
    final textStyle = Theme.of(context)
        .primaryTextTheme
        .title
        .copyWith(fontWeight: FontWeight.bold, color: kAlternateTextColor);
    return Text(
      'More images',
      style: textStyle,
    );
  }
}
