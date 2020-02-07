import 'package:flutter/material.dart';

class AppLogoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Plantpedia',
        style: Theme.of(context).primaryTextTheme.title.copyWith(
            fontSize: 28,
            fontFamily: 'JosefinSans',
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
