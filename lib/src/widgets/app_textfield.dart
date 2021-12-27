// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison, use_key_in_widget_constructors, prefer_const_constructors
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
        maxLength: 20,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            hintText: inputText,
            border: const OutlineInputBorder()),
        onChanged: onChanged,
        obscureText: obscureText == null ? false : obscureText);
  }
}
