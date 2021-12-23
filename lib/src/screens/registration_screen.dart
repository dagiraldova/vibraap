import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/services/authentication.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_icon.dart';
import 'package:flutterchat_app/src/widgets/app_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegistrationScreen extends StatefulWidget {
  static const String RouteName = "/registration";


  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late String _email;
  late String _password;
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
        ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppIcon(),
              SizedBox(height: 20,),
              AppTextField(inputText: "Email",onChanged: (value){_email =  value;}, obscureText: false,),
              SizedBox(height: 8,),
              AppTextField(inputText: "Password", onChanged: (value){_password =  value;}, obscureText: true),
              SizedBox(height: 8,),
             /* AppTextField(inputText: ""),
              SizedBox(height: 8,),
              AppTextField(inputText: ""),
              SizedBox(height: 8,),
              AppTextField(inputText: ""),
              SizedBox(height: 20),*/
              AppButton(color: Colors.grey.shade900, onPressed: (){
               Authentication().createUser(email: _email, password: _password);
              }, name: "Registrar")
            ],
          ),
        ),
      )
  
    );
  }
}

