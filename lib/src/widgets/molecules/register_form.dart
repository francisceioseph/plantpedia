import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantpedia/src/widgets/atoms/icon_form_text_field.dart';
import 'package:plantpedia/src/widgets/atoms/outline_form_button.dart';
import 'package:plantpedia/src/widgets/pages/App.dart';
import 'package:plantpedia/src/widgets/templates/loading_dialog.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _passwordConfirmationFocusNode = FocusNode();

  String _displayName;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      child: Center(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconFormTextField(
                labelText: 'Name',
                hintText: 'Your full name',
                leadingIcon: FontAwesomeIcons.user,
                keyboardType: TextInputType.text,
                validator: _validateNameField,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (v) {
                  _changeFocus(context, _emailFocusNode);
                },
                onFieldSaved: (v) {
                  setState(() => _displayName = v);
                },
              ),
              IconFormTextField(
                labelText: 'Email',
                hintText: 'Your email address',
                leadingIcon: FontAwesomeIcons.envelope,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                focusNode: _emailFocusNode,
                validator: _validateEmailField,
                onFieldSubmitted: (v) {
                  _changeFocus(context, _passwordFocusNode);
                },
                onFieldSaved: (v) {
                  setState(() => _email = v);
                },
              ),
              IconFormTextField(
                labelText: 'Password',
                hintText: 'Your password',
                leadingIcon: FontAwesomeIcons.lock,
                keyboardType: TextInputType.text,
                obscureText: true,
                textInputAction: TextInputAction.next,
                focusNode: _passwordFocusNode,
                validator: _validatePasswordField,
                onFieldSubmitted: (v) {
                  _changeFocus(context, _passwordConfirmationFocusNode);
                },
                onFieldSaved: (v) {
                  setState(() {
                    _password = v;
                  });
                },
              ),
              IconFormTextField(
                labelText: 'Password Confirmation',
                hintText: 'Your password again :)',
                leadingIcon: FontAwesomeIcons.lock,
                keyboardType: TextInputType.text,
                obscureText: true,
                textInputAction: TextInputAction.done,
                validator: _validatePasswordConfirmationField,
                focusNode: _passwordConfirmationFocusNode,
                onFieldSaved: (v) {
                  setState(() {
                    _password = v;
                  });
                },
              ),
              OutlineFormButton(
                text: 'Sign Up',
                onPressed: _onSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _changeFocus(
    BuildContext context,
    FocusNode focusNode,
  ) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  String _validateNameField(String value) {
    if (value.isEmpty) {
      return 'Name is a required field';
    }

    return null;
  }

  String _validateEmailField(String value) {
    if (value.isEmpty) {
      return 'Email is a required field';
    }
    return null;
  }

  String _validatePasswordField(String value) {
    if (value.isEmpty) {
      return 'Password is a required field';
    }

    setState(() {
      _password = value;
    });

    return null;
  }

  String _validatePasswordConfirmationField(String value) {
    if (value.isEmpty) {
      return 'Password confirmation is a required field';
    }

    if (value != _password) {
      return 'Password and password confirmation must be equal';
    }

    return null;
  }

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return LoadingDialog();
          });

      Future.delayed(Duration(seconds: 1)).then((value) {
        print(_displayName);
        print(_email);
        print(_password);

        Navigator.of(context).pop();
        Navigator.of(context).pushNamedAndRemoveUntil(
          App.routeName,
          (_) => false,
        );
      });

      // final bloc = AppBlocProvider.of(context).authBloc;
      // StreamSubscription<FirebaseUser> subscription;

      // _formKey.currentState.save();

      // bloc.createUser(_displayName, _email, _password);

      // subscription = bloc.user.listen(
      //   (user) {
      //     subscription.cancel();
      //     Navigator.of(context).pop();
      //     Navigator.of(context).pushNamedAndRemoveUntil('/', (_) => false);
      //   },
      //   onError: (error) {
      //     Navigator.of(context).pop();
      //     _buildErrorAlert(context, error, subscription);
      //   },
      // );
    }
  }

  // Future<dynamic> _buildErrorAlert(
  //   BuildContext context,
  //   dynamic error,
  //   StreamSubscription<FirebaseUser> subscription,
  // ) {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Error'),
  //         content: Text(
  //           "It's not possible to sign up now. Please, try again later",
  //         ),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('DISMISS'),
  //             onPressed: () {
  //               subscription.cancel();
  //               Navigator.of(context).pop();
  //             },
  //           )
  //         ],
  //       );
  //     },
  //   );
  // }
}
