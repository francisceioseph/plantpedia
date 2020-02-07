import 'package:flutter/material.dart';
import 'package:plantpedia/src/widgets/app_logo/app_logo_image.dart';
import 'package:plantpedia/src/widgets/app_logo/app_logo_text.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AppLogoImage(),
          AppLogoText(),
        ],
      ),
    );
  }
}
