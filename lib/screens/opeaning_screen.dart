import 'package:flutter/material.dart';
import 'package:flash_chat_app/screens/welcome_screen.dart';
import 'dart:async';

class OpeaningScreen extends StatefulWidget {
  static const String id = 'opening_screen';

  @override
  State<OpeaningScreen> createState() => _OpeaningScreenState();
}

class _OpeaningScreenState extends State<OpeaningScreen> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceInOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 0.8).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceInOut),
    );

    _controller.forward();
    //
    Timer(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, WelcomeScreen.id);
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Hero(
              tag: 'logo',
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('images/logo2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}
