import 'package:flutter/material.dart';
import 'package:plantpedia/src/widgets/atoms/app_logo.dart';
import 'package:plantpedia/src/widgets/molecules/login_form.dart';
import 'package:plantpedia/src/widgets/molecules/login_register_section.dart';
import 'package:plantpedia/src/widgets/molecules/login_social.dart';

class LoginPage extends StatelessWidget {
  static String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
        ),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AppLogo(),
                LoginForm(),
                _renderLoginSocialMessage(),
                LoginSocial(),
                LoginRegisterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _renderLoginSocialMessage() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Text('Also, you can login with'),
    );
  }
}
