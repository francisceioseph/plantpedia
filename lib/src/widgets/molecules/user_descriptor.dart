import 'package:flutter/material.dart';
import 'package:plantpedia/src/models/auth_view_model.dart';
import 'package:plantpedia/src/redux/actions/auth_actions.dart';
import 'package:plantpedia/src/redux/store.dart';
import 'package:plantpedia/src/widgets/atoms/outline_form_button.dart';
import 'package:plantpedia/src/widgets/templates/auth_connector.dart';

class UserDescriptor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthConnector(builder: (BuildContext context, AuthViewModel model) {
      final name = model.user == null ? '' : (model.user['name'] ?? 'No Name');
      final email = model.user == null ? '' : model.user['email'];

      return Container(
        margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 16),
              height: 96,
              width: 96,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/placeholder.jpg'),
              ),
            ),
            Text(
              name,
              style: Theme.of(context).primaryTextTheme.title,
            ),
            Text(
              email,
              style: Theme.of(context).primaryTextTheme.subhead,
            ),
            Expanded(
              child: Container(),
            ),
            ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: <Widget>[
                OutlineFormButton(
                  text: 'logout',
                  onPressed: () {
                    store.dispatch(Logout(context: context));
                  },
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
