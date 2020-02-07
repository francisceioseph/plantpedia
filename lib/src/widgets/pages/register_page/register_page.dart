import 'package:flutter/material.dart';
import 'package:plantpedia/src/utils/app_localizations.dart';
import 'package:plantpedia/src/widgets/app_logo/app_logo.dart';
import 'package:plantpedia/src/widgets/pages/register_page/register_form.dart';
import 'package:plantpedia/src/widgets/pages/register_page/register_login_section.dart';
import 'package:plantpedia/src/widgets/pages/register_page/register_social.dart';

class RegisterPage extends StatelessWidget {
  static String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('SIGN_UP_APP_BAR'),
        ),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AppLogo(),
                RegisterForm(),
                _renderRegisterSocialMessage(context),
                RegisterSocial(),
                RegisterLoginSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _renderRegisterSocialMessage(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Text(
        AppLocalizations.of(context).translate('SIGN_UP_SOCIAL_TEXT'),
      ),
    );
  }
}
