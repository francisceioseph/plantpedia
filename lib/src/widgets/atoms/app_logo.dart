import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/tropical-leaves.jpg'),
        ),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
    );
  }
}
