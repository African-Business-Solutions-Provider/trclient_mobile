import 'package:absp_mobile/globalcomponents/constants.dart';
import 'package:flutter/material.dart';

class DynamicFlow extends StatelessWidget {
  final Widget child;
  final String header;
  final String flowInfo;
  final Widget flowImg;
  const DynamicFlow(
      {Key key,
      this.child,
      @required this.header,
      @required this.flowInfo,
      @required this.flowImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Container(
      //width: double.infinity,
      //height: size.height,
      child: Column(
        mainAxisAlignment: this.header != "" && this.flowInfo != ""
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: this.header != "" && this.flowInfo != ""
                ? EdgeInsets.only(top: 50)
                : EdgeInsets.only(top: 25),
            child: Column(
              children: <Widget>[
                if (this.header != "")
                  Text(this.header,
                      style: TextStyle(color: appPrimaryColor, fontSize: 24)),
                if (this.flowInfo != "")
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      this.flowInfo,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 26),
            child: Center(
              child: this.flowImg,
            ),
          ),
          Container(
              child: child == null
                  ? Container(
                      margin: EdgeInsets.all(26),
                      padding: EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: appPrimaryColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Center(
                        child: Text("Get Started",
                            style: TextStyle(color: Colors.white)),
                      ),
                    )
                  : child),
        ],
      ),
    );
  }
}
