import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plantpedia/src/redux/actions/auth_actions.dart';
import 'package:plantpedia/src/redux/store.dart';
import 'package:plantpedia/src/utils/shared_validators.dart';
import 'package:plantpedia/src/widgets/atoms/icon_form_text_field.dart';
import 'package:plantpedia/src/widgets/atoms/outline_form_button.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

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
              _renderEmailField(),
              _renderPasswordField(),
              _renderSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderEmailField() {
    return IconFormTextField(
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
    );
  }

  Widget _renderPasswordField() {
    return IconFormTextField(
      labelText: 'Password',
      hintText: 'Your password',
      leadingIcon: FontAwesomeIcons.lock,
      keyboardType: TextInputType.text,
      obscureText: true,
      textInputAction: TextInputAction.done,
      focusNode: _passwordFocusNode,
      validator: _validatePasswordField,
      onFieldSaved: (v) {
        setState(() {
          _password = v;
        });
      },
    );
  }

  Widget _renderSubmitButton() {
    return OutlineFormButton(
      text: 'Sign In',
      onPressed: _onSubmit,
    );
  }

  void _onSubmit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      store.dispatch(Login(
        username: _email.trim(),
        password: _password.trim(),
        context: context,
      ));
    }
  }

  void _changeFocus(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  String _validateEmailField(String value) {
    if (value.isEmpty) {
      return 'Email is a required field';
    }

    if (!SharedValidators.validateEmail(value)) {
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
}
