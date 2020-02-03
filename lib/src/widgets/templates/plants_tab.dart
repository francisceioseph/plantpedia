import 'package:flutter/material.dart';
import 'package:plantpedia/src/widgets/templates/plants_connector.dart';

class PlantsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      child: Center(
        child: PlantsConnector(),
      ),
    );
  }
}
