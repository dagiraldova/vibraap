// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, unused_element, unused_field, deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterchat_app/src/services/authentication.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_icon.dart';
import 'package:flutterchat_app/src/widgets/app_textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const String routeName = '/resetPassword';

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  late String _password;
  late String _confirmPassword;
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade600,
      body: Center(
        child: Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.symmetric(horizontal: 25),
          width: 1000,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 350,
                height: 600,
                child: Image.asset('images/mobile-marketing-662x389.png'),
              ),
              Container(
                width: 450,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                alignment: Alignment.topRight,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: FlatButton.icon(
                        icon: Icon(
                          CupertinoIcons.return_icon,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Regresar",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context, '/login'),
                        shape: StadiumBorder(),
                        highlightColor: Colors.yellow.shade600,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        AppIcon(),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                              hintText: 'Contraseña',
                              suffixIcon: IconButton(
                                  icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color:
                                          Theme.of(context).primaryColorDark),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  })),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                              hintText: 'Contraseña',
                              suffixIcon: IconButton(
                                  icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color:
                                          Theme.of(context).primaryColorDark),
                                  onPressed: () {
                                    setState(() {
                                      passwordVisible = !passwordVisible;
                                    });
                                  })),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        AppButton(
                            color: Colors.grey.shade900,
                            onPressed: () async {},
                            name: "Restablecer Contraseña"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
