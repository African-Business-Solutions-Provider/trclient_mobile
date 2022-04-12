import 'package:absp_mobile/globalcomponents/background.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: size.height,
          padding:
              EdgeInsets.fromLTRB(size.width * 0.07, 0, size.width * 0.07, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
