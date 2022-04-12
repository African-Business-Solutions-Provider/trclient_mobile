import 'package:absp_mobile/Animations/FadeAnimation.dart';
import 'package:absp_mobile/globalcomponents/basictextinput.dart';
import 'package:absp_mobile/globalcomponents/passwordInput.dart';
import 'package:absp_mobile/globalcomponents/background.dart';
import 'package:absp_mobile/globalcomponents/roundedbtn.dart';
import 'package:flutter/material.dart';

import '../../drawer_screen.dart';
import '../../signup/signup.dart';
import '../../../globalcomponents/headingtext.dart';

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
              Row(
                children: [
                  Image.asset('assets/images/bizengage.png',
                      height: size.height * 0.09),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              FadeAnimation(
                  1,
                  Row(
                    children: [
                      HeaderText(
                          textcolor: Colors.white,
                          padder: EdgeInsets.all(0),
                          textvalue: 'Hello',
                          fontsize: size.height * 0.09,
                          weight: FontWeight.w800),
                    ],
                  )),
              FadeAnimation(
                  1,
                  Row(
                    children: [
                      HeaderText(
                          textcolor: Colors.white,
                          padder: EdgeInsets.all(0),
                          textvalue: 'There!',
                          fontsize: size.height * 0.08,
                          weight: FontWeight.w300),
                    ],
                  )),
              SizedBox(height: size.height * 0.03),
              BasicTextInput(
                text: 'Email',
                height: size.height * 0.07,
              ),
              SizedBox(height: size.height * 0.03),
              PasswordInput(
                text: 'Password',
                height: size.height * 0.07,
              ),
              SizedBox(height: size.height * 0.03),
              /* ButtonControl('LOGIN', () {
                Navigator.of(context).pushNamed(DrawerScreen.routeName);
              }), */
              RoundedButton(
                  text: "Login",
                  press: () {
                    Navigator.of(context).pushNamed(DrawerScreen.routeName);
                  }),
              SizedBox(height: size.height * 0.03),
              Text(
                'Forgot Password',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                    fontSize: 10,
                    letterSpacing: 2,
                    decoration: TextDecoration.none),
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.of(context).pushNamed(SignupScreen.routeName),
                    },
                    child: Text(
                      'Signup',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Montserrat'),
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
