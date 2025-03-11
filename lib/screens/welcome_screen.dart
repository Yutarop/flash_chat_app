import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flash_chat_app/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_app/components/rounded_button.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    animation = ColorTween(begin: Colors.blueAccent, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 100.0,
                    child: Image.asset(
                      'images/logo.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 40.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w900,
                        // decoration: TextDecoration.underline,
                      ),
                      speed: Duration(milliseconds: 100)
                    ),
                  ],
                  totalRepeatCount: 1,
                )
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ReusableButton(
              buttonColor: Colors.lightBlueAccent,
              buttonFunction: (){Navigator.pushNamed(context, LoginScreen.id);},
              buttonText: 'Log In',
            ),
            ReusableButton(
              buttonColor: Colors.blueAccent,
              buttonFunction: (){Navigator.pushNamed(context, RegistrationScreen.id);},
              buttonText: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
