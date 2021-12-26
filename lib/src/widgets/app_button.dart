// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  final String name;
  const AppButton(
      {required this.color, required this.onPressed, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30),
        elevation: 5,
        child: SizedBox(
          height: 50,
          width: 250,
          child: TextButton(
              child: Text(
                name,
                style: TextStyle(color: Colors.grey.shade50, fontSize: 20),
              ),
              onPressed: onPressed),
        ),
      ),
    );
  }
}
