import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String textvalue;
  final EdgeInsets padder;
  final double fontsize;
  final FontWeight weight;
  final Color textcolor;
  const HeaderText({
    Key key,
    @required this.textvalue,
    @required this.padder,
    @required this.fontsize,
    @required this.weight,
    @required this.textcolor,
  }) : super(key: key);

  //final styling
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padder,
      child: Text(
        textvalue,
        style: TextStyle(
            fontSize: fontsize,
            fontWeight: weight,
            color: textcolor,
            fontFamily: 'Montserrat'),
      ),
    );
  }
}
