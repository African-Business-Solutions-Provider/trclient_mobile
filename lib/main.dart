import 'package:absp_mobile/pages/aboutPage.dart';
import 'package:absp_mobile/pages/homePage.dart';
import 'package:absp_mobile/pages/profilePage.dart';
import 'package:absp_mobile/pages/requisitionsPage.dart';
import 'package:absp_mobile/pages/settingsPage.dart';
import 'package:absp_mobile/screens/drawer_screen.dart';
import 'package:absp_mobile/screens/login/login.dart';
import 'screens/signup/signup.dart';
import 'package:flutter/material.dart';
import 'screens/onboarding/screens.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABSP Mobile',
      theme: ThemeData(fontFamily: "Roboto"),
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignupScreen.routeName: (ctx) => SignupScreen(),
        DrawerScreen.routeName: (ctx) => DrawerScreen(),
        ProfilePage.routeName: (ctx) => ProfilePage(),
        SettingsPage.routeName: (ctx) => SettingsPage(),
        AboutPage.routeName: (ctx) => AboutPage(),
        OnboardingScreen.routeName: (ctx) => OnboardingScreen(),
        //GaugeChart.routeName: (ctx) => GaugeChart(),
        HomePage.routeName: (ctx) => HomePage(),
        RequisitionPage.routeName: (ctx) => RequisitionPage()
      },
    );
  }
}
