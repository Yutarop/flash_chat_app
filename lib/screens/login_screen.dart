import 'package:flutter/material.dart';
import 'package:flash_chat_app/screens/chat_screen.dart';
import 'package:flash_chat_app/components/rounded_button.dart';
import 'package:flash_chat_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Hero(
                        tag: 'logo',
                        child: Container(
                          height: 200.0,
                          child: Image.asset('images/logo.png'),
                        ),
                      ),
                      SizedBox(
                        height: 48.0,
                      ),
                      TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlign: TextAlign.center,
                          onChanged: (value) {
                            //Do something with the user input.
                            email = value;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Enter your email',
                          )
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        onChanged: (value) {
                          //Do something with the user input.
                          password = value;
                        },
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Enter your password',
                        ),
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      ReusableButton(
                          buttonColor: Colors.blueAccent,
                          buttonFunction: () async {
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              final newUser = await _auth
                                  .signInWithEmailAndPassword(
                                  email: email, password: password);
                              if (newUser != null) {
                                Navigator.pushNamed(context, ChatScreen.id);
                              }
                            }
                            catch (e) {
                              print(e);
                            }
                            setState(() {
                              showSpinner = false;
                            });
                          },
                          buttonText: 'Log In'
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
