import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const routeName = "/about";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("About ABSP",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
      ),
    );
  }
}
