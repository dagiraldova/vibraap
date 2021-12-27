// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, prefer_final_fields, unused_local_variable, non_constant_identifier_names, prefer_const_constructors_in_immutable, unused_import, dead_code, use_function_type_syntax_for_parameters, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, deprecated_member_use, constant_identifier_names
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_navigation_drawer.dart';
import 'package:flutterchat_app/src/widgets/app_textfield.dart';
import 'package:flutterchat_app/src/widgets/drop_down.dart';
import 'package:flutterchat_app/src/widgets/order_table.dart';
import 'package:flutterchat_app/src/widgets/product_table.dart';
import 'package:flutterchat_app/src/widgets/send_sms.dart';
import 'package:flutterchat_app/src/widgets/text_field_order.dart';

class OrderScreen extends StatefulWidget {
  static const String RouteName = "/order";
  OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

var flag = Row(mainAxisSize: MainAxisSize.max, children: [
  Icon(
    Icons.flag_outlined,
    color: Colors.yellow[500],
    size: 50,
  ),
]);

class _OrderScreenState extends State<OrderScreen> {
  late String _user;
  final TextStyle style =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);

  Future<void> ShowInfoDialog(BuildContext context) async {
    Random random = Random();
    int randomNumber = random.nextInt(1000000000);
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                        child: Icon(
                      CupertinoIcons.flag,
                      color: Colors.yellow,
                      size: 36,
                    )),
                    WidgetSpan(
                      child: Text(
                        'Nuevo Pedido',
                        style: style,
                      ),
                    ),
                  ]),
                ),
                Text.rich(
                  TextSpan(children: <InlineSpan>[
                    WidgetSpan(
                      child: Column(
                        children: [
                          Text(
                            "N° de pedido",
                            style: TextStyle(
                                color: Colors.yellow.shade600,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$randomNumber",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            actions: <Widget>[
              SizedBox(
                height: 550,
                width: 900,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: <InlineSpan>[
                                      WidgetSpan(
                                        alignment: PlaceholderAlignment.top,
                                        child: Text(
                                          'Usuario',
                                          style: style,
                                        ),
                                      ),
                                      WidgetSpan(
                                          child: SizedBox(
                                        width: 9,
                                        height: 30,
                                      )),
                                      WidgetSpan(
                                          child: AppTextFieldOrder(
                                              inputText:
                                                  'Ingrese el numero del celular',
                                              onChanged: (value) {
                                                _user = value;
                                              },
                                              obscureText: false)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Text.rich(
                                  TextSpan(
                                    children: <InlineSpan>[
                                      WidgetSpan(
                                        child: Text(
                                          'Mesa',
                                          style: style,
                                        ),
                                      ),
                                      WidgetSpan(
                                          child: Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          DropDownWidget(),
                                        ],
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ProductTable(),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                    ]),
                    SizedBox(
                      height: 20,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 200,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 8),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                          Text(
                                            "Subtotal",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Iva",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Total",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 70,
                              width: 250,
                            ),
                            Container(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                  child: Row(
                                children: [
                                  SizedBox(
                                    width: 40,
                                  ),
                                  Container(
                                    child: FlatButton.icon(
                                      icon: Icon(
                                        CupertinoIcons.clear_thick_circled,
                                        color: Colors.white,
                                      ),
                                      label: Text("Cancelar"),
                                      color: Colors.grey.shade200,
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      shape: StadiumBorder(),
                                      highlightColor: Colors.yellow,
                                    ),
                                  ),
                                  Container(
                                    child: FlatButton.icon(
                                      icon: Icon(
                                        CupertinoIcons.add_circled,
                                        color: Colors.white,
                                      ),
                                      label: Text("Aceptar"),
                                      color: Colors.yellow.shade600,
                                      onPressed: () =>
                                          Navigator.pop(context, 'Ok'),
                                      shape: StadiumBorder(),
                                      highlightColor: Colors.yellow,
                                    ),
                                  )
                                ],
                              )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ])
                  ],
                ),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
      ),
      body: Center(
        child: Container(
          child: Column(
            children: <Widget>[
              SendSms(),
              Container(
                child: FlatButton.icon(
                  icon: Icon(
                    CupertinoIcons.flag,
                    color: Colors.white,
                  ),
                  label: Text("Nuevo Pedido"),
                  color: Colors.yellow,
                  onPressed: () async {
                    await ShowInfoDialog(context);
                  },
                  shape: StadiumBorder(),
                  highlightColor: Colors.yellow,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 430,
                    height: 130,
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(left: 50, top: 200),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(234, 236, 239, 1.0)),
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.delete_outline,
                          size: 30.0,
                          color: Colors.grey,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 7.0),
                              child: Text('N° pedido 5614987345',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0)),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.0),
                              width: 110.0,
                              height: 28.0,
                              child: RaisedButton(
                                elevation: 0.5,
                                shape: StadiumBorder(),
                                color: Colors.yellowAccent,
                                onPressed: () {
                                  Navigator.pushNamed(context, 'edit');
                                },
                                child: Text(
                                  "Modificar",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.black),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
