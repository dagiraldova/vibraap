// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppTextFieldOrder extends StatelessWidget {
  final String inputText;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  const AppTextFieldOrder(
      {required this.inputText,
      required this.onChanged,
      required this.obscureText});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 31,
      width: 125,
      child: TextField(
        keyboardType: TextInputType.number,
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.black, fontSize: 13),
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            fillColor: Colors.yellow.shade600,
            filled: true),
      ),
    );
  }
}
