import 'package:flutter/material.dart';
import 'package:plantpedia/src/constants.dart';
import 'package:plantpedia/src/utils/app_localizations.dart';

final fields = [
  {
    'key': 'tubers',
    'translate': 'PROPAGATION_TUBERS_TEXT',
  },
  {
    'key': 'sprigs',
    'translate': 'PROPAGATION_SPRIGS_TEXT',
  },
  {
    'key': 'sod',
    'translate': 'PROPAGATION_SOD_TEXT',
  },
  {
    'key': 'seed',
    'translate': 'PROPAGATION_SEED_TEXT',
  },
  {
    'key': 'cuttings',
    'translate': 'PROPAGATION_CUTTINGS_TEXT',
  },
  {
    'key': 'corms',
    'translate': 'PROPAGATION_CORMS_TEXT',
  },
  {
    'key': 'container',
    'translate': 'PROPAGATION_CONTAINER_TEXT',
  },
  {
    'key': 'bulbs',
    'translate': 'PROPAGATION_BULBS_TEXT',
  },
  {
    'key': 'bare_root',
    'translate': 'PROPAGATION_BARE_ROOT_TEXT',
  },
];

class PropagationDescriptionCard extends StatelessWidget {
  final dynamic propagation;

  PropagationDescriptionCard({@required this.propagation});

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
            'PROPAGATION_CARD_TITLE_TEXT',
          ),
          style: cardTitleStyle,
        ),
      ),
    ];

    fields.forEach((field) {
      final value = propagation[field['key']];

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
