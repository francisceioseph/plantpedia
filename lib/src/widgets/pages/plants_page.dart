import 'package:flutter/material.dart';
import 'package:plantpedia/src/widgets/templates/plants_connector.dart';

class PlantsPage extends StatelessWidget {
  static String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'PlantPedia',
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            right: 16,
            left: 16,
          ),
          child: Center(
            child: PlantsConnector(),
          ),
        ),
      ),
    );
  }
}
