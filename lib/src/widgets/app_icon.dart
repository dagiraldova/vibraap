import 'package:flutter/material.dart';


class AppIcon extends StatelessWidget {

 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      
          children: [
            Image.asset('images/iconflutter.png'),
          ],
        );
  }
}