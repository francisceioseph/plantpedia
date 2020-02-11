import 'package:flutter/material.dart';
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
        ? Color(0xffFFEEDB)
        : Color(0xff6E4555);

    final children = <Widget>[
      Container(
        margin: EdgeInsets.only(
          bottom: 16,
        ),
        child: Text(
          AppLocalizations.of(context).translate(
            'FLOWER_CARD_TITLE_TEXT',
          ),
          style: titleStyle,
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
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
