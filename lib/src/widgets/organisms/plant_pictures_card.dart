import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantpedia/src/constants.dart';
import 'package:plantpedia/src/models/plant_image_model.dart';
import 'package:plantpedia/src/widgets/atoms/blur_box.dart';
import 'package:plantpedia/src/widgets/atoms/placeholder_image.dart';
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
    final backgroundColor = Theme.of(context).brightness == Brightness.light
        ? Color(0xff0b6623)
        : Color(0xff4c5c68);

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
            color: backgroundColor.withOpacity(0.75),
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          child: ListView(
            children: <Widget>[
              _renderUpDownButton(),
              _renderCardTitle(),
              _renderPlantImages(),
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
      splashColor: Colors.grey[350],
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
    final textStyle = Theme.of(context).primaryTextTheme.title.copyWith(
          fontFamily: 'JosefinSans',
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: kAlternateTextColor,
        );
    return Text(
      'More images',
      style: textStyle,
    );
  }

  Widget _renderPlantImages() {
    if (_height > kMinHeight) {
      return _renderPlantsImageCarousel();
    }

    return _renderPlantsImageList();
  }

  Widget _renderPlantsImageList() {
    return PlantPicturesList(
      images: widget.images,
    );
  }

  Widget _renderPlantsImageCarousel() {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(
        top: 16,
      ),
      child: CarouselSlider.builder(
        itemCount: widget.images.length,
        height: _height - 340,
        viewportFraction: 0.8,
        enableInfiniteScroll: false,
        itemBuilder: (BuildContext context, int index) {
          final image = widget.images[index];

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: CachedNetworkImage(
                imageUrl: image.url,
                fit: BoxFit.cover,
                placeholder: (context, url) => PlaceholderImage(),
                errorWidget: (context, url, error) => PlaceholderImage(),
              ),
            ),
          );
        },
      ),
    );
  }
}
