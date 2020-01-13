import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Plantpedia',
        style: Theme.of(context).primaryTextTheme.title.copyWith(fontSize: 24),
      ),
    );
  }
}
