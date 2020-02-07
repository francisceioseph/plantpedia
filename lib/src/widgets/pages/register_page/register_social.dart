import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RegisterSocial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.google),
            onPressed: _registerWithGoogle,
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.facebook),
            onPressed: _registerWithFacebook,
          )
        ],
      ),
    );
  }

  _registerWithGoogle() {}
  _registerWithFacebook() {}
}
