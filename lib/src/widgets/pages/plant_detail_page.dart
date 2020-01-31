import 'package:flutter/material.dart';
import 'package:plantpedia/src/widgets/templates/plant_connector.dart';

class PlantDetailPage extends StatelessWidget {
  static String routeName = '/plant';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        title: Text('Details'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: PlantConnector(),
        ),
      ),
    );
  }
}
