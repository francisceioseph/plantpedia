import 'package:flutter/material.dart';
import 'package:plantpedia/src/widgets/atoms/app_title.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _renderLogoImage(),
          AppTitle(),
        ],
      ),
    );
  }

  _renderLogoImage() {
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
