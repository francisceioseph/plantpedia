import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantpedia/src/constants.dart';
import 'package:plantpedia/src/models/species_model.dart';
import 'package:plantpedia/src/utils/app_localizations.dart';
import 'package:plantpedia/src/widgets/blur_box/blur_box.dart';
import 'package:plantpedia/src/widgets/flower_description_card/flower_description_card.dart';
import 'package:plantpedia/src/widgets/foliage_description_card/foliage_description_card.dart';
import 'package:plantpedia/src/widgets/growth_description_card/growth_description_card.dart';
import 'package:plantpedia/src/widgets/html_text_card/html_text_card.dart';
import 'package:plantpedia/src/widgets/propagation_description_card/propagation_description_card.dart';

class SpeciesDetailsCardSection extends StatefulWidget {
  final SpeciesModel species;

  SpeciesDetailsCardSection({this.species});

  @override
  _SpeciesDetailsCardSectionState createState() =>
      _SpeciesDetailsCardSectionState();
}

class _SpeciesDetailsCardSectionState extends State<SpeciesDetailsCardSection> {
  double _height = 200;

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
            right: 4,
            left: 4,
          ),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: backgroundColor.withOpacity(0.75),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: ListView(
            children: <Widget>[
              _renderUpDownButton(),
              HtmlTextCard(
                titleText: AppLocalizations.of(context).translate(
                  'ABOUT_PLANT_TEXT',
                ),
                htmlText: widget.species.description,
              ),
              if (shouldShowFlowerCard)
                FlowerDescriptionCard(
                  flower: widget.species.flower,
                ),
              if (shouldShowFoliageCard)
                FoliageDescriptionCard(
                  foliage: widget.species.foliage,
                ),
              if (shouldShowPropagationCard)
                PropagationDescriptionCard(
                  propagation: widget.species.propagation,
                ),
              if (shouldShowGrowthCard)
                GrowthDescriptionCard(
                  growth: widget.species.growth,
                )
            ],
          ),
        ),
      ),
    );
  }

  get shouldShowFoliageCard => _showIfPropertiesSet(
        widget.species.foliage,
      );

  get shouldShowFlowerCard => _showIfPropertiesSet(
        widget.species.flower,
      );

  get shouldShowPropagationCard => _showIfPropertiesSet(
        widget.species.propagation,
      );

  get shouldShowGrowthCard => _showIfPropertiesSet(
        widget.species.growth,
      );

  get isExpanded => _height > 200;

  get backgroundColor => Theme.of(context).brightness == Brightness.light
      ? Color(0x2b5329)
      : kGreen50;

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

  bool _showIfPropertiesSet(dynamic obj) {
    return obj.values
            .where((f) => f != null && f.toString().length > 0)
            .length >
        1;
  }
}
