import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/widgets/app_navigation_drawer.dart';

class ProfileScreen extends StatefulWidget {
  static const String RouteName = "/profile";
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
      ),
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: 25),
          width: 1000,
          height: 350,
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
        ),
      ),
    );
  }
}
