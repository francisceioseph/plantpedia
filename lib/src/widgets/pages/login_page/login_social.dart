import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginSocial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(FontAwesomeIcons.google),
            onPressed: _loginWithGoogle,
          ),
          IconButton(
            icon: Icon(FontAwesomeIcons.facebook),
            onPressed: _loginWithFacebook,
          )
        ],
      ),
    );
  }

  _loginWithGoogle() {}
  _loginWithFacebook() {}
}
