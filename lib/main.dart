import 'package:flash_chat_app/screens/opeaning_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_app/screens/welcome_screen.dart';
import 'package:flash_chat_app/screens/login_screen.dart';
import 'package:flash_chat_app/screens/registration_screen.dart';
import 'package:flash_chat_app/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: OpeaningScreen.id,
      routes: {
        OpeaningScreen.id: (context) => OpeaningScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
      },

    );
  }
}
