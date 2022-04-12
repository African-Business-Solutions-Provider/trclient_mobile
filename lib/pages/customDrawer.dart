import 'package:absp_mobile/repository/nav.dart';
import 'package:flutter/material.dart';

class CustomAppDrawer extends StatelessWidget {
  final String pageRoute;
  //final Function stateFn;
  const CustomAppDrawer({Key key, this.pageRoute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 20,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/avatar1.png',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  )),
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tafadzwa Ruturi",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.8),
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto")),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      child: Text("truturi@absp.co.zw",
                          style: TextStyle(fontSize: 12, color: Colors.white)),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: drawerItems
                .map((e) => GestureDetector(
                      onTap: () => {
                        if (e['target'] != "")
                          /* setState(() {
                                    xoffset = 0;
                                    yoffset = 0;
                                    scalefactor = 1;
                                    tabopen = false;
                                  }) */

                          {Navigator.of(context).pushNamed(e['target'])}
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 7, bottom: 7),
                        child: Row(
                          children: [
                            Icon(
                              e['icon'],
                              color: e['target'] == pageRoute
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.7),
                              size: 25,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              e['title'],
                              style: TextStyle(
                                  color: e['target'] == pageRoute
                                      ? Colors.white
                                      : Colors.white.withOpacity(0.7),
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 15,
                    ),
                    Text(
                      "Settings",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.normal),
                    )
                  ],
                ),
                SizedBox(width: 1),
                GestureDetector(
                  onTap: () => {Navigator.of(context).pushNamed("/onboard")},
                  child: Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Logout",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
