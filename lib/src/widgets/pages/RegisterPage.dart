import 'package:flutter/material.dart';
import 'package:plantpedia/src/widgets/atoms/app_logo.dart';
import 'package:plantpedia/src/widgets/atoms/app_title.dart';
import 'package:plantpedia/src/widgets/molecules/register_form.dart';
import 'package:plantpedia/src/widgets/molecules/register_login_section.dart';
import 'package:plantpedia/src/widgets/molecules/register_social.dart';

class RegisterPage extends StatelessWidget {
  static String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
        ),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AppLogo(),
                AppTitle(),
                RegisterForm(),
                _renderRegisterSocialMessage(),
                RegisterSocial(),
                RegisterLoginSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _renderRegisterSocialMessage() {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Text('Also, you can register with'),
    );
  }
}
