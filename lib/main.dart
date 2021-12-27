import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/screens/edit_screen.dart';
import 'package:flutterchat_app/src/screens/login_screen.dart';
import 'package:flutterchat_app/src/screens/order_history_screen.dart';
import 'package:flutterchat_app/src/screens/order_screen.dart';
import 'package:flutterchat_app/src/screens/products_screen.dart';
import 'package:flutterchat_app/src/screens/profile_screen.dart';
import 'package:flutterchat_app/src/screens/registration_screen.dart';
import 'package:flutterchat_app/src/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCIwFAKpVI69Xp4bmofzg_70tBfxS3bqg8",
      appId: "1:149759091292:android:5f85947b0fdc5b8df9bc99",
      messagingSenderId: "149759091292",
      projectId: "vibrapp-47e7e",
    ),
  );

  runApp(MaterialApp(
      home: WelcomeScreen(),
      theme: ThemeData(
          textTheme: const TextTheme(
              bodyText1: TextStyle(
        color: Colors.black38,
      ))),
      initialRoute: LoginScreen.routeName,
      routes: <String, WidgetBuilder>{
        LoginScreen.routeName: (BuildContext context) => LoginScreen(),
        WelcomeScreen.routeName: (BuildContext context) => WelcomeScreen(),
        RegistrationScreen.RouteName: (BuildContext context) =>RegistrationScreen(),
        OrderScreen.RouteName: (BuildContext context) => OrderScreen(),
        ProductsScreen.RouteName: (BuildContext context) => ProductsScreen(),
        OrderHistoryScreen.routeName: (BuildContext context) => OrderHistoryScreen(),
        EditPage.routeName: (BuildContext context) => EditPage(),
        ProfileScreen.RouteName: (BuildContext context) => ProfileScreen()
      }));
}
