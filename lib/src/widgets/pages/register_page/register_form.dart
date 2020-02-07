import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantpedia/src/redux/actions/auth_actions.dart';
import 'package:plantpedia/src/redux/store.dart';
import 'package:plantpedia/src/utils/app_localizations.dart';
import 'package:plantpedia/src/utils/shared_validators.dart';
import 'package:plantpedia/src/widgets/icon_form_text_field/icon_form_text_field.dart';
import 'package:plantpedia/src/widgets/outline_form_button/outline_form_button.dart';

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
  String _passwordConfirmation;

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
                labelText: AppLocalizations.of(context).translate('NAME_LABEL'),
                hintText:
                    AppLocalizations.of(context).translate('NAME_PLACEHOLDER'),
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
                labelText:
                    AppLocalizations.of(context).translate('EMAIL_LABEL'),
                hintText:
                    AppLocalizations.of(context).translate('EMAIL_PLACEHOLDER'),
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
                labelText:
                    AppLocalizations.of(context).translate('PASSWORD_LABEL'),
                hintText: AppLocalizations.of(context)
                    .translate('PASSWORD_PLACEHOLDER'),
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
                labelText: AppLocalizations.of(context)
                    .translate('PASSWORD_CONFIRMATION_LABEL'),
                hintText: AppLocalizations.of(context)
                    .translate('PASSWORD_CONFIRMATION_PLACEHOLDER'),
                leadingIcon: FontAwesomeIcons.lock,
                keyboardType: TextInputType.text,
                obscureText: true,
                textInputAction: TextInputAction.done,
                validator: _validatePasswordConfirmationField,
                focusNode: _passwordConfirmationFocusNode,
                onFieldSaved: (v) {
                  setState(() {
                    _passwordConfirmation = v;
                  });
                },
              ),
              OutlineFormButton(
                text: AppLocalizations.of(context)
                    .translate('SIGN_UP_BUTTON_TEXT'),
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

    if (!SharedValidators.validateEmail(value.trim())) {
      return 'It must be a valid email';
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
      _formKey.currentState.save();

      store.dispatch(
        Register(
          name: _displayName.trim(),
          email: _email.trim(),
          password: _password.trim(),
          passwordConfirmation: _passwordConfirmation.trim(),
          context: context,
        ),
      );
    }
  }
}
