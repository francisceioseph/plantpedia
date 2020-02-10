import 'package:flutter/material.dart';
import 'package:plantpedia/src/constants.dart';
import 'package:plantpedia/src/utils/app_localizations.dart';

final fields = [
  {
    'key': 'texture',
    'translate': 'FOLIAGE_TEXTURE_TEXT',
  },
  {
    'key': 'porosity_winter',
    'translate': 'FOLIAGE_POROSITY_WINTER_TEXT',
  },
  {
    'key': 'porosity_summer',
    'translate': 'FOLIAGE_POROSITY_SUMMER_TEXT',
  },
  {
    'key': 'color',
    'translate': 'FOLIAGE_COLOR_TEXT',
  },
];

class FoliageDescriptionCard extends StatelessWidget {
  final dynamic foliage;

  FoliageDescriptionCard({@required this.foliage});

  @override
  Widget build(BuildContext context) {
    final cardTitleStyle = Theme.of(context).primaryTextTheme.title.copyWith(
          fontFamily: 'JosefinSans',
          fontSize: 21,
          fontWeight: FontWeight.bold,
        );

    final cardSubheadStyle = Theme.of(context)
        .primaryTextTheme
        .subhead
        .copyWith(fontFamily: 'JosefinSans', color: kgreen5);

    final children = <Widget>[
      Container(
        margin: EdgeInsets.only(
          bottom: 16,
        ),
        child: Text(
          AppLocalizations.of(context).translate(
            'FOLIAGE_CARD_TITLE_TEXT',
          ),
          style: cardTitleStyle,
        ),
      ),
    ];

    fields.forEach((field) {
      final value = foliage[field['key']];

      if (value != null && value.toString().length > 0) {
        final title = Container(
          margin: EdgeInsets.only(top: 16),
          child: Text(
            AppLocalizations.of(context).translate(
              field['translate'],
            ),
            style: cardSubheadStyle,
          ),
        );

        final content = Text(value);

        children.add(title);
        children.add(content);
      }
    });

    return Card(
      elevation: 4,
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
