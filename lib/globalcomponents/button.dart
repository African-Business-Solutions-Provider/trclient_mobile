import 'package:flutter/material.dart';

class ButtonControl extends StatelessWidget {
  final String btnText;
  final Function callback;
  ButtonControl(this.btnText, this.callback);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        shadowColor: Colors.blueAccent,
        color: Colors.lightBlueAccent,
        elevation: 7,
        child: GestureDetector(
          onTap: callback,
          child: Center(
            child: Text(
              btnText,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  letterSpacing: 2),
            ),
          ),
        ),
      ),
    );
  }
}
