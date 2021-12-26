// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import, use_key_in_widget_constructors, unused_field, prefer_const_literals_to_create_immutables, dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    AppIcon(),
                    SizedBox(
                      height: 20,
                    ),
                    AppTextField(
                      inputText: "Usuario",
                      onChanged: (value) {
                        _email = value;
                      },
                      obscureText: false,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _Password = value;
                      },
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                          hintText: 'Contraseña',
                          suffixIcon: IconButton(
                              color: Colors.black,
                              icon: Icon(
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark),
                              onPressed: () {
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              })),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          child: Text("Has olvidado tu contraseña?",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.grey.shade400,
                                  fontSize: 16)),
                          onTap: () {
                            Navigator.pushNamed(context, '/resetPassword');
                          }),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AppButton(
                        color: Colors.grey.shade900,
                        onPressed: () async {
                          var user = await Authentication()
                              .loginUser(email: _email, password: _Password);
                          if (user != null) {
                            Navigator.pushNamed(context, '/home');
                          }
                        },
                        name: "Iniciar Sesion"),
                    Center(
                      child: RichText(
                          text: TextSpan(
                              text: 'Si no tienes cuenta',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                              children: <TextSpan>[
                            TextSpan(
                                text: ' registrate',
                                style: TextStyle(
                                    color: Colors.yellow.shade600,
                                    fontSize: 18),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, '/registration');
                                  })
                          ])),
                    )
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
