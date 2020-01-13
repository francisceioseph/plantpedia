import 'package:flutter/material.dart';

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
          child: Text('10000236589 Apple Watch'),
        ),
      ),
    );
  }
}
