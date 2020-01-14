import 'package:flutter/material.dart';
import 'package:plantpedia/src/widgets/templates/plants_connector.dart';

class App extends StatelessWidget {
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PlantPedia',
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          right: 16,
          left: 16,
        ),
        child: Center(
          child: PlantsConnector(),
        ),
      ),
    );
  }
}
