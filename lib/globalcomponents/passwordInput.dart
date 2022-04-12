import 'package:flutter/material.dart';

import 'constants.dart';

class PasswordInput extends StatelessWidget {
  final String text;
  final double height;
  const PasswordInput({
    Key key,
    this.text,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: appPrimaryColor,
              letterSpacing: 0),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: appPrimaryColor)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: appPrimaryColor, width: 0.5),
          ),
        ),
        obscureText: true,
      ),
    );
  }
}
