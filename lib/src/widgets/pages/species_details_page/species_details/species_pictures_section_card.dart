import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantpedia/src/constants.dart';
import 'package:plantpedia/src/models/image_model.dart';
import 'package:plantpedia/src/utils/app_localizations.dart';
import 'package:plantpedia/src/widgets/blur_box/blur_box.dart';
import 'package:plantpedia/src/widgets/pictures_list/pictures_list.dart';
import 'package:plantpedia/src/widgets/placeholder_image/placeholder_image.dart';

class SpeciesPicturesCardSection extends StatefulWidget {
  final List<ImageModel> images;

  SpeciesPicturesCardSection({
    this.images,
  });

  @override
  _SpeciesPicturesCardSectionState createState() =>
      _SpeciesPicturesCardSectionState();
}

class _SpeciesPicturesCardSectionState
    extends State<SpeciesPicturesCardSection> {
  static const double kMinHeight = 370;
  double _height = kMinHeight;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        Theme.of(context).brightness == Brightness.light ? kgreen4 : kGreen45;

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
    return GestureDetector(
      onVerticalDragUpdate: (DragUpdateDetails details) {
        _setHeightForDragDirection(details.localPosition.dy);
      },
      child: IconButton(
        icon: Icon(
          isExpanded
              ? FontAwesomeIcons.chevronDown
              : FontAwesomeIcons.chevronUp,
          color: Colors.grey[600],
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
      ),
    );
  }

  Widget _renderCardTitle() {
    final textStyle = Theme.of(context).primaryTextTheme.title.copyWith(
          fontSize: 21,
          fontWeight: FontWeight.bold,
        );
    return Text(
      AppLocalizations.of(context).translate('MORE_IMAGES_TEXT'),
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
    return PicturesList(
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

  get appBarHeight {
    return AppBar().preferredSize.height;
  }

  get screenHeight {
    return MediaQuery.of(context).size.height;
  }

  double get maxHeight => this.screenHeight - this.appBarHeight - 36.0;

  void _setHeightForDragDirection(double dy) {
    setState(() {
      if (dy < 0) {
        _height = maxHeight;
      } else {
        _height = kMinHeight;
      }
    });
  }
}
