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
                        child: OrderTable(),
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
      backgroundColor: Colors.grey.shade200,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          FlatButton.icon(
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
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text("Lista de de pedidos"),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 90,
                  child: ListView.separated(
                    padding: EdgeInsets.all(2),
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    separatorBuilder: (context, _) => SizedBox(
                      width: 12,
                    ),
                    itemBuilder: (context, index) => buildCard(),
                  ),
                  /*Row(
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
                                    Navigator.pushNamed(context, '/edit');
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
                )*/
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [Text("Tu información")],
                ),
                SizedBox(height: 20),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        //1
                        padding:
                            EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                        width: 225,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                    "NIT               \n\n"
                                    "Teléfono               \n\n"
                                    "Forma De pago               \n\n"
                                    "Oficina               \n\n"
                                    "Canal               \n\n"
                                    "Grupo cliente               ",
                                    style: TextStyle(
                                        fontSize:12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey.shade600
                                        )
                                            ), //falta dividers y alternativa para separar el texto
                                Text(
                                  "CL 56654884\n\n"
                                  "3152013826\n\n"
                                  "CR\n\n"
                                  "01\n\n"
                                  "01\n\n"
                                  "25",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 12, 
                                      color: Colors.grey.shade500,
                                      fontWeight: FontWeight.bold
                                      ),
                                )
                              ],
                            )
                          ],
                        ),
                      ), //1
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        //2
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        width: 225,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: Column(
                              children: [
                                Row(
                                  children:[
                                    Text("N° de pedidos", 
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600,
                                      fontSize: 16
                                    ),
                                    )
                                  ]
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text("50", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow, fontSize: 40))
                                  ],
                                ),
                                SizedBox(height:10),
                                Divider(),
                                SizedBox(height:10),
                                Row(
                                  children: [
                                    Text("Cartera", 
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600,
                                      fontSize: 16
                                    ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    Text(
                                    "Total               \n\n"
                                    "Total vencido               \n\n",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade600
                                    )
                                    ),
                                    
                                    Text(
                                    "\$ 700.695\n\n"
                                    "\$ 0\n\n",
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow,
                                      
                                    )
                                    ) 
                                  ],
                                )
                              ],
                            ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 400,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 1,
                                  offset: Offset(0, 1),
                                ),
                              ],
                            ),
                            
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                width: 195,
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                width: 195,
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0, 1),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ) //2
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildCard() => Container(
        padding: EdgeInsets.all(10),
        width: 230,
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "N° de pedido - ",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "154564654654",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Hamburguesa(x2)\nGaseosa(x2)\nMesa 5",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade500
                  ),
                ),
              ],
            )
          ],
        ),
      );
  Widget BuildCardInfo(int height, int width) => Container(
        padding: EdgeInsets.all(10),
        width: 200,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 1),
            ),
          ],
        ),
      );
}
