import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final String text;
  VoidCallback onPressed;

  Button({super.key ,required this.text ,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: Theme.of(context).colorScheme.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
    );
  }
}