// ignore_for_file: unused_field, prefer_const_constructors, unnecessary_null_comparison
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/services/authentication.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_icon.dart';
import 'package:flutterchat_app/src/widgets/app_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class RegistrationScreen extends StatefulWidget {
  static const String RouteName = "/registration";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailController = TextEditingController();
  final mobileNumberController = TextEditingController();
  FilePickerResult? result;
  bool passwordVisible = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow.shade600,
        body: Center(
          child: Form(
            key: _formKey,
            child: Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.symmetric(horizontal: 25),
                width: 1000,
                height: 600,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    AppIcon(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 300,
                          width: 300,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                title: RaisedButton(
                                  child: Text(
                                    "Importar imagen",
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () {
                                    pickFiles();
                                  },
                                  shape: UnderlineInputBorder(),
                                  highlightColor: Colors.yellow,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                leading: Icon(Icons.account_circle),
                                title: TextFormField(
                                  keyboardType: TextInputType.name,
                                  controller: nameController,
                                  decoration:
                                      InputDecoration(hintText: 'Nombre'),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                leading: Icon(Icons.email),
                                title: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  decoration:
                                      InputDecoration(hintText: 'Correo'),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 300,
                          width: 300,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                leading: Icon(Icons.lock),
                                title: TextFormField(
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: passwordController,
                                  obscureText: passwordVisible,
                                  decoration: InputDecoration(
                                      hintText: 'Contraseña',
                                      suffixIcon: IconButton(
                                          color: Colors.black,
                                          icon: Icon(
                                              passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Theme.of(context)
                                                  .primaryColorDark),
                                          onPressed: () {
                                            setState(() {
                                              passwordVisible =
                                                  !passwordVisible;
                                            });
                                          })),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                leading: Icon(Icons.lock),
                                title: TextFormField(
                                  controller: confirmPasswordController,
                                  obscureText: passwordVisible,
                                  decoration: InputDecoration(
                                      hintText: 'Contraseña',
                                      suffixIcon: IconButton(
                                          color: Colors.black,
                                          icon: Icon(
                                              passwordVisible
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Theme.of(context)
                                                  .primaryColorDark),
                                          onPressed: () {
                                            setState(() {
                                              passwordVisible =
                                                  !passwordVisible;
                                            });
                                          })),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                leading: Icon(Icons.phone),
                                title: TextFormField(
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      InputDecoration(hintText: 'Celular'),
                                  controller: mobileNumberController,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    AppButton(
                        color: Colors.black,
                        onPressed: () {
                          setState(() {
                            if (passwordController.text.toString() ==
                                confirmPasswordController.text.toString()) {
                              print(nameController.text.toString());
                              print(passwordController.text.toString());
                              print(confirmPasswordController.text.toString());
                              print(emailController.text.toString());
                              print(mobileNumberController.text.toString());
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text(
                                            "Las contrasenas no coinciden"),
                                      ));
                            }

                            if (nameController.text.toString().isNotEmpty &&
                                passwordController.text.toString().isNotEmpty &&
                                confirmPasswordController.text
                                    .toString()
                                    .isNotEmpty &&
                                emailController.text.toString().isNotEmpty &&
                                mobileNumberController.text
                                    .toString()
                                    .isNotEmpty) {
                              print(nameController.text.toString());
                              print(passwordController.text.toString());
                              print(confirmPasswordController.text.toString());
                              print(emailController.text.toString());
                              print(mobileNumberController.text.toString());
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title:
                                            Text("por favor llenar los datos"),
                                      ));
                            }
                          });
                        },
                        name: "Registrarse")
                  ],
                )),
          ),
        ));
  }

  void pickFiles() async {
    result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result == null) return;

    PlatformFile? file = result!.files.first;

    viewFile(file);
  }

  void viewFile(PlatformFile file) async {
    OpenFile.open(file.path);
  }
}
