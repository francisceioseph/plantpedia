import 'package:flutter/material.dart';

class LoginRegisterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Do not have an account? '),
          FlatButton(
            child: Text('register'),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
