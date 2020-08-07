import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/component/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    print('controller.value');
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation =
        ColorTween(begin: Colors.red, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade300,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: <String>['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundButtonWidget(
               text: "Log In",colour: Colors.lightBlueAccent, onPress: (){
                Navigator.pushNamed(context, LoginScreen().id);
            },),
            RoundButtonWidget(
              text: "Register",colour: Colors.blue, onPress: (){
              Navigator.pushNamed(context, RegistrationScreen().id);
            },),
          ],
        ),
      ),
    );
  }
}


