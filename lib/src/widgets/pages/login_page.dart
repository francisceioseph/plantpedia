import 'package:flutter/material.dart';
import 'package:plantpedia/src/utils/app_localizations.dart';
import 'package:plantpedia/src/widgets/molecules/app_logo.dart';
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
          AppLocalizations.of(context).translate('LOGIN_APP_BAR'),
        ),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AppLogo(),
                LoginForm(),
                _renderLoginSocialMessage(context),
                LoginSocial(),
                LoginRegisterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _renderLoginSocialMessage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Text(
        AppLocalizations.of(context).translate('LOGIN_SOCIAL_TEXT'),
      ),
    );
  }
}
