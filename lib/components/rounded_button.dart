import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {

  final Color buttonColor;
  final VoidCallback buttonFunction;
  final String buttonText;

  ReusableButton({required this.buttonColor, required this.buttonFunction, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: buttonFunction,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            buttonText,
          ),
        ),
      ),
    );
  }
}