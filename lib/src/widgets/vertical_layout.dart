import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_icon.dart';

class VerticalLayout extends StatelessWidget {
  final Color color;
  const VerticalLayout({required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            AppIcon(),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  height: 650,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(15)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text.rich(TextSpan(text: "hola")),
                      SizedBox(
                        height: 70,
                      ),
                      FlatButton.icon(
                        icon: Icon(
                          CupertinoIcons.home,
                          color: Colors.yellow.shade600,
                        ),
                        label: Text(
                          "Home",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        color: Colors.grey.shade900,
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                      FlatButton.icon(
                        icon: Icon(
                          CupertinoIcons.location,
                          color: Colors.yellow.shade600,
                        ),
                        label: Text(
                          "Pedidos",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                        color: Colors.grey.shade900,
                        onPressed: () {
                          Navigator.pushNamed(context, '/orderhistory');
                        },
                      ),
                      FlatButton.icon(
                        icon: Icon(
                          CupertinoIcons.cube_box,
                          color: Colors.yellow.shade600,
                        ),
                        label: Text(
                          "Inventario",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.grey.shade900,
                        onPressed: () {
                          Navigator.pushNamed(context, '');
                        },
                      ),
                      FlatButton.icon(
                        icon: Icon(
                          CupertinoIcons.doc_text_search,
                          color: Colors.yellow.shade600,
                        ),
                        label: Text(
                          "Informes",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.grey.shade900,
                        onPressed: () {},
                      ),
                      FlatButton.icon(
                        icon: Icon(
                          CupertinoIcons.profile_circled,
                          color: Colors.yellow.shade600,
                        ),
                        label: Text(
                          "Mi perfil",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.grey.shade900,
                        onPressed: () {
                          Navigator.pushNamed(context, '');
                        },
                      ),
                      SizedBox(
                        height: 220,
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Celu',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'W',
                                  style: TextStyle(
                                      color: Colors.yellow.shade600,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: 'eb',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )
                              ]))
                    ],
                  ),
                ),
                SizedBox(
                  width: 23,
                )
              ],
            ),
          ],
        )
      ],
    );
  }
}
