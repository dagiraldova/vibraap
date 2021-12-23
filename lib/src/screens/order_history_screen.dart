// ignore_for_file: prefer_final_fields, prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_dropdown_button.dart';
import 'package:flutterchat_app/src/widgets/app_navigation_drawer.dart';
import 'package:flutterchat_app/src/widgets/app_textfield.dart';

class OrderHistoryScreen extends StatefulWidget {
  static const String routeName = "/orderhistory";
  OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  _OrderHistoryScreenState createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  late String _user;
  late String _product;
  var _items = ["1", "2", "3", "4", "5"];
  Object? _vista = "Mesa";

  Future<void> ShowInfoDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("Nuevo pedido"),
            actions: <Widget>[
              //Text("Usuario"),
              AppTextField(
                  inputText: "Usuario",
                  onChanged: (value) {
                    _user = value;
                  },
                  obscureText: false),
              const SizedBox(
                height: 8,
              ),
              AppTextField(
                  inputText: "Producto",
                  onChanged: (value) {
                    _product = value;
                  },
                  obscureText: false),
              Row(
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  DropdownButton(
                    items: _items.map((String a) {
                      return DropdownMenuItem(value: a, child: Text(a));
                    }).toList(),
                    onChanged: (_value) => {
                      setState(() {
                        _vista = _value;
                      })
                    },
                    hint: Text(_vista.toString()),
                  ),
                ],
              ),

              FlatButton.icon(
                icon: Icon(
                  CupertinoIcons.add_circled,
                  color: Colors.white,
                ),
                label: Text("Aceptar"),
                color: Colors.yellow.shade600,
                onPressed: () {
                  Navigator.of(context).pop();
                  FirebaseFirestore.instance.collection('pedidos').add(
                      {'mesa': _vista, 'producto': _product, 'usuario': _user});
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('pedidos').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AppDropDownButton(
                  items: ['Sin entregar', 'Entregados', 'Por fechas'],
                  view: 'Pedidos actuales',
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    width: 1000,
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: DataTable(columns: const [
                        DataColumn(label: Text("")),
                        DataColumn(label: Text("N° de pedido")),
                        DataColumn(label: Text("Descripción")),
                        DataColumn(label: Text("Mesa")),
                        DataColumn(label: Text("Valor")),
                        DataColumn(label: Text("Estado del producto")),
                      ], rows: [
                        DataRow(cells: [
                          DataCell(IconButton(
                            color: Colors.grey.shade900,
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {},
                          )),
                          DataCell(Text('165564564')),
                          DataCell(Text('Hamburguesa')),
                          DataCell(Text('4')),
                          DataCell(Text('10000 cop')),
                          DataCell(AppDropDownButton(
                            items: ['Entregado', 'Sin entregar'],
                            view: 'Sin entregar',
                          ))
                        ]),
                        DataRow(cells: [
                          DataCell(IconButton(
                            color: Colors.grey.shade900,
                            icon: Icon(Icons.remove_circle_outline),
                            onPressed: () {},
                          )),
                          DataCell(Text('165564564')),
                          DataCell(Text('Hamburguesa')),
                          DataCell(Text('4')),
                          DataCell(Text('10000 cop')),
                          DataCell(AppDropDownButton(
                            items: ['Entregado', 'Sin entregar'],
                            view: 'Sin entregar',
                          ))
                        ]),
                      ]),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
