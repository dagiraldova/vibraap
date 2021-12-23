// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_icon.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '';
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade700,
      body: Center(
        child: Container(
          child: hola(),
        ),
      ),
    );
  }
}

Widget hola() {
  return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text("hola"),
      ));
}
