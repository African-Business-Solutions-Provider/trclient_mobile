import 'package:absp_mobile/globalcomponents/basictextinput.dart';
import 'package:absp_mobile/globalcomponents/constants.dart';
import 'package:absp_mobile/globalcomponents/passwordInput.dart';
import 'package:absp_mobile/globalcomponents/roundedbtn.dart';
import 'package:absp_mobile/pages/homePage.dart';
import 'package:absp_mobile/screens/onboarding/components/dynamicflow.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatefulWidget {
  static String routeName = "/onboard";
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  double windowWidth = 0;
  double windowHeight = 0;
  double _loginOffsetY = 0;
  double _loginOffsetX = 0;
  double _loginWidth = 0;
  double _loginOpacity = 1;
  String _backImg = "assets/images/logo_c.png";
  var _mainBackground = Colors.white;
  double _regiserOffsetY = 0;
  int _pageState = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? appPrimaryColor : Colors.lightBlue[100],
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    windowWidth = size.width;
    windowHeight = size.height;

    switch (_pageState) {
      case 0:
        _backImg = "assets/images/logo_c.png";
        _loginOffsetY = windowHeight;
        _loginOffsetX = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _regiserOffsetY = windowHeight;
        _mainBackground = Colors.white;
        break;
      case 1:
        _backImg = "assets/images/logo_w.png";
        _loginOffsetY = 100;
        _loginOffsetX = 0;
        _loginWidth = windowWidth;
        _loginOpacity = 1;
        _regiserOffsetY = windowHeight;
        _mainBackground = appPrimaryColor;
        break;
      case 2:
        _loginOffsetY = 80;
        _loginOffsetX = 20;
        _loginWidth = windowWidth - (_loginOffsetX * 2);
        _loginOpacity = 0.7;
        _regiserOffsetY = 100;
        break;
    }
    return Scaffold(
        body: Stack(
      children: <Widget>[
        AnimatedContainer(
          color: _mainBackground,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          child: Container(
              height: size.height,
              child: GestureDetector(
                onTap: () => {
                  if (_pageState != 0)
                    {
                      setState(() {
                        _pageState = 0;
                      })
                    }
                },
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    DynamicFlow(
                      header: "Connect Your Business",
                      flowInfo:
                          "We connect your business to the best suppliers and we connect suppliers to businesses",
                      flowImg: Image.asset("assets/images/procback.png"),
                      child: Container(
                        margin: EdgeInsets.all(26),
                        padding: EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(),
                        ),
                      ),
                    ),
                    DynamicFlow(
                      header: "Procurement on the go",
                      flowInfo:
                          "Manage requisitions on the go. It`s like having your workspace in your pocket",
                      flowImg: Image.asset("assets/images/started.png"),
                      child: Container(
                        margin: EdgeInsets.all(26),
                        padding: EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(),
                        ),
                      ),
                    ),
                    DynamicFlow(
                      header: "Authorisation on the go",
                      flowInfo:
                          "Don`t stop the flow of business when you`re not around, authorise actions whenever and wherever you are",
                      flowImg: Lottie.asset(
                          'assets/animationlottie/fingerprint.json'),
                      child: Container(
                        margin: EdgeInsets.all(26),
                        padding: EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _buildPageIndicator(),
                        ),
                      ),
                    ),
                    DynamicFlow(
                      header: _pageState > 0 ? "" : "Welcome",
                      flowInfo: _pageState > 0
                          ? ""
                          : "To a new way to stay connected to your procurement business",
                      flowImg: _pageState > 0
                          ? Image.asset(_backImg, height: size.height * 0.11)
                          : Image.asset(_backImg, height: size.height * 0.20),
                      child: GestureDetector(
                        onTap: () => {
                          //Navigator.of(context).pushNamed(LoginScreen.routeName),
                          setState(() {
                            _pageState = 1;
                          })
                        },
                        child: Container(
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
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
        AnimatedContainer(
          width: _loginWidth,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(_loginOffsetX, _loginOffsetY, 1),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(_loginOpacity),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          padding: EdgeInsets.only(left: 20, right: 20),
          height: size.height - 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              BasicTextInput(
                text: 'Email',
                height: 20,
              ),
              PasswordInput(
                text: 'Password',
                height: 20,
              ),
              RoundedButton(
                  text: "Login",
                  press: () {
                    Navigator.of(context).pushNamed(HomePage.routeName);
                  }),
              Text(
                'Forgot Password',
                style: TextStyle(
                    color: appPrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    letterSpacing: 2,
                    decoration: TextDecoration.none),
              ),
              GestureDetector(
                  onTap: () => {
                        setState(() {
                          _pageState = 2;
                        })
                      },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Don\'t have an account? '),
                      Text(
                        'Signup',
                        style: TextStyle(color: appPrimaryColor),
                      )
                    ],
                  )),
            ],
          ),
        ),
        AnimatedContainer(
          curve: Curves.fastLinearToSlowEaseIn,
          duration: Duration(milliseconds: 1000),
          transform: Matrix4.translationValues(0, _regiserOffsetY, 1),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          ),
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: SingleChildScrollView(
            child: Container(
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  BasicTextInput(
                    text: 'Organisation',
                    height: 15,
                  ),
                  BasicTextInput(
                    text: 'Username',
                    height: 15,
                  ),
                  PasswordInput(
                    text: 'Password',
                    height: 15,
                  ),
                  RoundedButton(
                      text: "Register",
                      press: () {
                        setState(() {
                          _pageState = 1;
                        });
                      }),
                  GestureDetector(
                    onTap: () => {
                      setState(() {
                        _pageState = 1;
                      })
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Already have an account? '),
                        Text(
                          'Login',
                          style: TextStyle(color: appPrimaryColor),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
