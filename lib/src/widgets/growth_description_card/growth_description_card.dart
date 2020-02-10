import 'package:flutter/material.dart';
import 'package:plantpedia/src/constants.dart';
import 'package:plantpedia/src/utils/app_localizations.dart';

final fields = [
  {
    'key': 'shade_tolerance',
    'translate': 'GROWTH_SHADE_TOLERANCE_TEXT',
  },
  {
    'key': 'salinity_tolerance',
    'translate': 'GROWTH_SALINITY_TOLERANCE_TEXT',
  },
  {
    'key': 'ph_minimum',
    'translate': 'GROWTH_PH_MINIMUM_TEXT',
  },
  {
    'key': 'ph_maximum',
    'translate': 'GROWTH_PH_MAXIMUM_TEXT',
  },
  {
    'key': 'moisture_use',
    'translate': 'GROWTH_MOISTURE_USE_TEXT',
  },
];

class GrowthDescriptionCard extends StatelessWidget {
  final dynamic growth;

  GrowthDescriptionCard({@required this.growth});

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
            'GROWTH_CARD_TITLE_TEXT',
          ),
          style: cardTitleStyle,
        ),
      ),
    ];

    fields.forEach((field) {
      final value = growth[field['key']];

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
