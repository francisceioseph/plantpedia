import 'package:flutter/material.dart';
import 'package:plantpedia/src/widgets/pages/RegisterPage.dart';

class LoginRegisterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Do not have an account? '),
          FlatButton(
            child: Text('register'),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                RegisterPage.routeName,
                (_) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
