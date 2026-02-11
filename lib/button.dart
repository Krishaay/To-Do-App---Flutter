import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;

  NewButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color.fromRGBO(126, 172, 181, 100),
      child: Text(text),
      );
  }
}