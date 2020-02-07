import 'package:flutter/material.dart';

class AppLogoImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      margin: EdgeInsets.only(right: 16),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/tropical-leaves.jpg'),
      ),
    );
  }
}
