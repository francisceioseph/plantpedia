import 'package:flutter/material.dart';
import 'package:plantpedia/src/utils/app_localizations.dart';
import 'package:plantpedia/src/widgets/pages/login_page.dart';

class RegisterLoginSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('SIGN_IN_INVITE_TEXT'),
          ),
          FlatButton(
            child: Text(
              AppLocalizations.of(context).translate('LOGIN_BUTTON_TEXT'),
            ),
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
