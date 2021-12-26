// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_null_comparison, prefer_if_null_operators

import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String inputText;
  final ValueChanged<String> onChanged;
  final bool obscureText;
  const AppTextField(
      {required this.inputText,
      required this.onChanged,
      required this.obscureText});
  @override
  Widget build(BuildContext context) {
    return TextField(
        maxLength: 15,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            hintText: inputText,
            border: const UnderlineInputBorder()),
        onChanged: onChanged,
        obscureText: obscureText == null ? false : obscureText);
  }
}
