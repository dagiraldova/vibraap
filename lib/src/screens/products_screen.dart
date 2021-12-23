// ignore_for_file: unused_import, unused_local_variable, unused_field, non_constant_identifier_names, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/db/db_provider.dart';
import 'package:flutterchat_app/src/db/repository.dart';
import 'package:flutterchat_app/src/services/operation.dart';
import 'package:flutterchat_app/src/widgets/app_button.dart';
import 'package:flutterchat_app/src/widgets/app_navigation_drawer.dart';
import 'package:flutterchat_app/src/widgets/app_textfield.dart';
import 'package:flutterchat_app/src/model/producto.dart';
import 'package:flutterchat_app/src/widgets/product_table.dart';

class ProductsScreen extends StatefulWidget {
  static const String RouteName = "/productos";
  ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
//Controladores variables
  final GlobalKey<FormState> keyForm = GlobalKey();
  final _codigoProductoCtrl = TextEditingController();
  final _nombreProdcutoCtrl = TextEditingController();
  final _precioProductoCtrl = TextEditingController();
  final _codigoFlitroCtrl = TextEditingController();
  List<Producto> _productsList = [];
  //final List<Producto> _list = Operation().findAll() as List<Producto>;

  @override
  void initState() {
    super.initState();
    final _codigoProductoCtrl = TextEditingController();
    final _nombreProdcutoCtrl = TextEditingController();
    final _precioProductoCtrl = TextEditingController();
    _loadData();
    
  }

  _loadData() async {
    var productsList = await Operation().productos();
    print(productsList.length);
     productsList.addAll(_productsList);
    // setState(() {
      
    // });
  }

  final TextStyle style =
      TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);

//Formulario para guardar los datos del producto
  Future<void> ShowInfoDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text.rich(
              TextSpan(children: <InlineSpan>[
                WidgetSpan(
                    child: Icon(
                  CupertinoIcons.flag,
                  color: Colors.yellow,
                  size: 36,
                )),
                WidgetSpan(
                  child: Text(
                    'Nuevo Producto',
                    style: style,
                  ),
                ),
              ]),
            ),

            //Formulario producto
            actions: <Widget>[
              SizedBox(
                height: 650,
                width: 900,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                        ),
                      ),
                    ),
                    const Text("Nombre de producto"),
                    TextFormField(
//                     //inputText: "Nombre producto",
                        controller: _nombreProdcutoCtrl,
                        obscureText: false),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text("Código producto"),
                    TextField(
                        controller: _codigoProductoCtrl, obscureText: false),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text("Valor producto"),
                    TextField(
                        controller: _precioProductoCtrl, obscureText: false),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 200,
                            ),

                            //Botones de Aceptar y cancelar
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
                                      onPressed: () {
                                        Navigator.pop(context, 'Ok');
                                        var producto = Producto(
                                            codigo: int.parse(
                                                _codigoProductoCtrl.text
                                                    .toString()),
                                            nombreProducto: _nombreProdcutoCtrl
                                                .text
                                                .toString(),
                                            precioProducto: int.parse(
                                                _precioProductoCtrl.text
                                                    .toString()));
                                        setState(() {});

                                       // ProductTable().createState().agregarProducto(producto);
                                        Operation().saveData(producto);
                                        _productsList.add(producto);
                                        
                                        
                                      },
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

  //Botón crear producto
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
              Container(
                child: FlatButton.icon(
                  icon: Icon(
                    CupertinoIcons.flag,
                    color: Colors.white,
                  ),
                  label: Text("Nuevo Producto"),
                  color: Colors.yellow,
                  onPressed: () async {
                    await ShowInfoDialog(context);
                  },
                  shape: StadiumBorder(),
                  highlightColor: Colors.yellow,
                ),
              ),

              //Tabla de productos
              //ProductTable(),
              DataTable(
      sortColumnIndex: 0,
      columns: <DataColumn>[
        DataColumn(
            label: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/productos');
          },
          icon: Icon(Icons.add),
          color: Colors.black,
        )),
        DataColumn(
            label: Text("Nombre Producto"),
            tooltip: "Nombre Producto",
            numeric: true,
            onSort: (int columnIndex, bool ascending) {}),
        DataColumn(
            label: Text("Codigo"),
            tooltip: "Codigo",
            numeric: true,
            onSort: (int columnIndex, bool ascending) {}),
        DataColumn(
            label: Text("Valor Ud"),
            tooltip: "Valor Ud",
            numeric: true,
            onSort: (int columnIndex, bool ascending) {}),
      ],
      rows: _productsList.map((_productsList) {
        return DataRow(cells: [
          DataCell(Text('')),
          DataCell(Text('${_productsList.nombreProducto.toString()}')),
          DataCell(Text('${_productsList.codigo.toString()}')),
          DataCell(Text('${_productsList.precioProducto.toString()}')),
        ]);
      }).toList(),
    )
            ],
          ),
        ),
      ),
    );
  }
}
