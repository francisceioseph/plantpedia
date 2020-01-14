import 'package:flutter/material.dart';
import 'package:plantpedia/src/widgets/pages/login_page.dart';

class RegisterLoginSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Do not have an account? '),
          FlatButton(
            child: Text('login'),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                LoginPage.routeName,
                (_) => false,
              );
            },
          )
        ],
      ),
    );
  }
}
