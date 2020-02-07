import 'package:flutter/material.dart';
import 'package:plantpedia/src/utils/app_localizations.dart';
import 'package:plantpedia/src/widgets/pages/register_page/register_page.dart';

class LoginRegisterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('SIGN_UP_INVITE_TEXT'),
          ),
          FlatButton(
            child: Text(
              AppLocalizations.of(context).translate('SIGN_UP_BUTTON_TEXT'),
            ),
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
