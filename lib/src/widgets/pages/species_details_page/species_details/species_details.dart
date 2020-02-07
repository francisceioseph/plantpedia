import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/species_model.dart';
import 'package:plantpedia/src/widgets/pages/species_details_page/species_details/species_details_banner.dart';
import 'package:plantpedia/src/widgets/pages/species_details_page/species_details/species_details_section_card.dart';
import 'package:plantpedia/src/widgets/pages/species_details_page/species_details/species_details_subtitle.dart';
import 'package:plantpedia/src/widgets/pages/species_details_page/species_details/species_details_title.dart';
import 'package:plantpedia/src/widgets/pages/species_details_page/species_details/species_pictures_section_card.dart';

class SpeciesDetails extends StatelessWidget {
  final SpeciesModel species;

  SpeciesDetails({this.species});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        alignment: AlignmentDirectional.topStart,
        children: <Widget>[
          SpeciesDetailsBanner(species: species),
          _renderPlantNames(),
          _renderOtherPictures(),
          SpeciesDetailsCardSection(
            species: species,
          ),
        ],
      ),
    );
  }

  Widget _renderOtherPictures() {
    if (species.images.length > 1) {
      return SpeciesPicturesCardSection(
        images: species.images,
      );
    }

    return Container();
  }

  Widget _renderPlantNames() {
    final children = <Widget>[
      SpeciesDetailsTitle(species: species),
    ];

    if (species.commonName.isNotEmpty) {
      children.add(
        SpeciesDetailsSubtitle(species: species),
      );
    }

    return Container(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
