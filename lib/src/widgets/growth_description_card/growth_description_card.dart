import 'package:flutter/material.dart';
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
    final theme = Theme.of(context);
    final textTheme = theme.primaryTextTheme;

    final titleStyle = textTheme.title.copyWith(
      fontSize: 21,
      fontWeight: FontWeight.bold,
    );

    final subheadStyle = theme.brightness == Brightness.light
        ? textTheme.subhead
        : textTheme.subhead.copyWith(
            color: Colors.white,
          );

    final textStyle = textTheme.body1;

    final cardColor = theme.brightness == Brightness.light
        ? Color(0xffFAFFC1)
        : Color(0xff546A7B);

    final children = <Widget>[
      Container(
        margin: EdgeInsets.only(
          bottom: 16,
        ),
        child: Text(
          AppLocalizations.of(context).translate(
            'GROWTH_CARD_TITLE_TEXT',
          ),
          style: titleStyle,
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
            style: subheadStyle,
          ),
        );

        final content = Text(
          value,
          style: textStyle,
        );

        children.add(title);
        children.add(content);
      }
    });

    return Card(
      color: cardColor,
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
