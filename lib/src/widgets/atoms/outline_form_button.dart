import 'package:flutter/material.dart';

class OutlineFormButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  OutlineFormButton({
    Key key,
    @required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buttonColor = Theme.of(context).buttonColor;

    return Container(
      margin: EdgeInsets.only(top: 16),
      child: ListTile(
        title: OutlineButton(
          child: Text(
            this.text,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          color: buttonColor,
          textColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          borderSide: BorderSide(color: buttonColor),
          onPressed: this.onPressed,
        ),
      ),
    );
  }
}
