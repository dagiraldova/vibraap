// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterchat_app/src/services/authentication.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_icon.dart';
import 'package:flutterchat_app/src/widgets/app_textfield.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String _email;
  late String _Password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellowAccent,
        body: Center(
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 25),
            width: 450,
            height: 450,
            decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                AppIcon(),
                SizedBox(
                  height: 20,
                ),
                AppTextField(
                  inputText: "Ingresar Email",
                  onChanged: (value) {
                    _email = value;
                  },
                  obscureText: false,
                ),
                SizedBox(
                  height: 8,
                ),
                AppTextField(
                  inputText: "Ingresar Contraseña",
                  onChanged: (value) {
                    _Password = value;
                  },
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                AppButton(
                    color: Colors.grey.shade900,
                    onPressed: () async {
                      var user = await Authentication()
                          .loginUser(email: _email, password: _Password);
                      if (user != null) {
                        Navigator.pushNamed(context, '/order');
                      }
                    },
                    name: "Iniciar Sesion"),
              ],
            ),
          ),
        ));
  }
}
