import 'package:absp_mobile/pages/profilePage.dart';
import 'package:absp_mobile/pages/settingsPage.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  static const routeName = "/drawer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(
                  0.1, 0.0), // 10% of the width, so there are ten blinds.
              colors: [
                Colors.yellowAccent,
                Colors.blueAccent
              ], // whitish to gray
            ),
          ),
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(8, 30, 8, 90.0),
                child: Image.asset(
                  'assets/images/bizengage.png',
                  height: 80,
                ),
              ),
              CustomListTile(
                  Icons.dashboard,
                  'Dashboard',
                  () => {
                        // Navigator.pushNamed(context, GaugeChart.routeName),
                      }),
              CustomListTile(Icons.assignment, 'Requisitions', () => {}),
              CustomListTile(Icons.notifications, 'Notifications', () => {}),
              CustomListTile(
                  Icons.person,
                  'Profile',
                  () => {
                        Navigator.pushNamed(context, ProfilePage.routeName),
                      }),
              CustomListTile(
                  Icons.settings,
                  'Settings',
                  () => {
                        Navigator.pushNamed(context, SettingsPage.routeName),
                      }),
              CustomListTile(Icons.lock_outline, 'Logout', () => {}),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Card(
              elevation: 0,
              color: Colors.black12,
              child: ListTile(
                onTap: () =>
                    {Navigator.pushNamed(context, ProfilePage.routeName)},
                title: Text(
                  'Ellen Rutiri',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      letterSpacing: 2),
                ),
                subtitle: Text(
                  'Designer',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Montserrat',
                      letterSpacing: 2),
                ),
                leading: CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://twitter.com/hackervist"),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Card()
        ],
      ),
    );
  }

  Widget makeItem({image, title}) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.3),
              ])),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 1.5,
                  fontFamily: 'Montserrat'),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: InkWell(
        splashColor: Colors.green,
        onTap: onTap,
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
              // Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
