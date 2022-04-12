import 'package:absp_mobile/Animations/FadeAnimation.dart';
import 'package:absp_mobile/globalcomponents/background.dart';
import 'package:absp_mobile/globalcomponents/basictextinput.dart';
import 'package:absp_mobile/globalcomponents/headingtext.dart';
import 'package:absp_mobile/globalcomponents/passwordInput.dart';
import 'package:absp_mobile/globalcomponents/roundedbtn.dart';
import 'package:absp_mobile/screens/login/login.dart';
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
                          textvalue: 'Create',
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
                          textvalue: 'Account!',
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
              PasswordInput(
                text: 'Confirm Password',
                height: size.height * 0.07,
              ),
              SizedBox(height: size.height * 0.03),
              /* ButtonControl('LOGIN', () {
                Navigator.of(context).pushNamed(DrawerScreen.routeName);
              }), */
              RoundedButton(text: "Sign Up", press: () {}),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () => {
                      Navigator.of(context).pushNamed(LoginScreen.routeName),
                    },
                    child: Text(
                      'Login',
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
