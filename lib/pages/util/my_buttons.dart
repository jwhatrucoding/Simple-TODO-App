// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;


  MyButtons({
    super.key,
    required this.text,
    required this.onPressed,
  });
  
  @override
  Widget build(BuildContext context){
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.yellow[400],
      child: Text(text),
    );
  }
}