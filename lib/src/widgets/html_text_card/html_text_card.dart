import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlTextCard extends StatelessWidget {
  final String titleText;
  final String htmlText;

  HtmlTextCard({
    @required this.titleText,
    @required this.htmlText,
  });

  @override
  Widget build(BuildContext context) {
    final cardTitleStyle = Theme.of(context).primaryTextTheme.title.copyWith(
          fontSize: 21,
          fontWeight: FontWeight.bold,
        );

    final htmlTextStyle = Theme.of(context).primaryTextTheme.body1.copyWith(
          fontSize: 18,
        );

    return Card(
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this.titleText,
              style: cardTitleStyle,
            ),
            Html(
              customTextAlign: (node) => TextAlign.justify,
              customTextStyle: (node, style) => htmlTextStyle,
              data: this.htmlText,
            ),
          ],
        ),
      ),
    );
  }
}
