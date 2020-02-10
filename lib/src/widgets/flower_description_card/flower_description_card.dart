import 'package:flutter/material.dart';
import 'package:plantpedia/src/constants.dart';
import 'package:plantpedia/src/utils/app_localizations.dart';

final fields = [
  {
    'key': 'conspicuous',
    'translate': 'FLOWER_TYPE_TEXT',
  },
  {
    'key': 'color',
    'translate': 'FLOWER_COLOR_TEXT',
  },
];

class FlowerDescriptionCard extends StatelessWidget {
  final dynamic flower;

  FlowerDescriptionCard({@required this.flower});

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
            'FLOWER_CARD_TITLE_TEXT',
          ),
          style: cardTitleStyle,
        ),
      ),
    ];

    fields.forEach((field) {
      final value = flower[field['key']];

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
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
