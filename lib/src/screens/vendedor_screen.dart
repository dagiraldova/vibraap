
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutterchat_app/src/db/db_provider.dart';
// import 'package:flutterchat_app/src/db/repository.dart';
// import 'package:flutterchat_app/src/model/vendedor.dart';
// import 'package:flutterchat_app/src/services/operation.dart';
// import 'package:flutterchat_app/src/widgets/app_button.dart';
// import 'package:flutterchat_app/src/widgets/app_navigation_drawer.dart';
// import 'package:flutterchat_app/src/widgets/app_textfield.dart';
// import 'package:flutterchat_app/src/model/producto.dart';
// import 'package:flutterchat_app/src/widgets/product_table.dart';

// class VendedoresScreen extends StatefulWidget {
//   static const String RouteName = "/productos";
//   VendedoresScreen({Key? key}) : super(key: key);

//   @override
//   _VendedoresScreenState createState() => _VendedoresScreenState();
// }

// class _VendedoresScreenState extends State<VendedoresScreen> {
// //Controladores variables
//   final GlobalKey<FormState> keyForm = GlobalKey();
//   final _codigoVendedorCtrl = TextEditingController();
//   final _nombreVendedorCtrl = TextEditingController();
//   final _telefonoVendedorCtrl = TextEditingController();
  
//   List<Vendedor> _vendedoresList = [];
//   //final List<Producto> _list = Operation().findAll() as List<Producto>;

//   @override
//   void initState() {
//     super.initState();
//     final _codigoVendedorCtrl = TextEditingController();
//     final _nombreVendedorCtrl = TextEditingController();
//     final _telefonoVendedorCtrl = TextEditingController();
    
//     _loadData();
//   }

//   _loadData() async {
//     var vendedoresList = await Operation().vendedores();
//     print(vendedoresList.length);
//     _vendedoresList.addAll(vendedoresList);
//     return _vendedoresList;
//   }

//   final TextStyle style =
//       TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);

// //Formulario para guardar los datos del producto
//   Future<void> ShowInfoDialog(BuildContext context) async {
//     return await showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             content: Text.rich(
//               TextSpan(children: <InlineSpan>[
//                 WidgetSpan(
//                     child: Icon(
//                   CupertinoIcons.flag,
//                   color: Colors.yellow,
//                   size: 36,
//                 )),
//                 WidgetSpan(
//                   child: Text(
//                     'Nuevo vendedor',
//                     style: style,
//                   ),
//                 ),
//               ]),
//             ),

//             //Formulario producto
//             actions: <Widget>[
//               SizedBox(
//                 height: 650,
//                 width: 900,
//                 child: Column(
//                   children: [
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                         ),
//                       ),
//                     ),
//                     const Text("Nombre de vendedor"),
//                     TextFormField(
// //                     //inputText: "Nombre producto",
//                         controller: _nombreVendedorCtrl,
//                         obscureText: false),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     const Text("Código vendedor"),
//                     TextField(
//                         controller: _codigoVendedorCtrl, obscureText: false),
//                     const SizedBox(
//                       height: 8,
//                     ),
//                     const Text("Teléfono vendedor"),
//                     TextField(
//                         controller: _telefonoVendedorCtrl, obscureText: false),
//                     Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//                       Align(
//                         alignment: Alignment.bottomRight,
//                         child: Column(
//                           children: [
//                             SizedBox(
//                               width: 200,
//                             ),

//                             //Botones de Aceptar y cancelar
//                             Container(
//                               alignment: Alignment.bottomRight,
//                               child: Container(
//                                   child: Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 40,
//                                   ),
//                                   Container(
//                                     child: FlatButton.icon(
//                                       icon: Icon(
//                                         CupertinoIcons.clear_thick_circled,
//                                         color: Colors.white,
//                                       ),
//                                       label: Text("Cancelar"),
//                                       color: Colors.grey.shade200,
//                                       onPressed: () =>
//                                           Navigator.pop(context, 'Cancel'),
//                                       shape: StadiumBorder(),
//                                       highlightColor: Colors.yellow,
//                                     ),
//                                   ),
//                                   Container(
//                                     child: FlatButton.icon(
//                                       icon: Icon(
//                                         CupertinoIcons.add_circled,
//                                         color: Colors.white,
//                                       ),
//                                       label: Text("Aceptar"),
//                                       color: Colors.yellow.shade600,
//                                       onPressed: () {
//                                         Navigator.pop(context, 'Ok');
//                                         var vendedor = Vendedor(
//                                             codigoVendedor: int.parse(
//                                                 _codigoVendedorCtrl.text
//                                                     .toString()),
//                                             nombreVendedor: _nombreVendedorCtrl
//                                                 .text
//                                                 .toString(),
//                                             telefonoVendedor:  int.parse(
//                                                 _telefonoVendedorCtrl.text
//                                                     .toString()));

//                                         setState(() {});
//                                         // ProductTable().createState().agregarProducto(producto);
//                                         Operation().saveDataVendedor(vendedor);
//                                         _vendedoresList.add(vendedor);
                                        
//                                       },
//                                       shape: StadiumBorder(),
//                                       highlightColor: Colors.yellow,
//                                     ),
//                                   )
//                                 ],
//                               )),
//                             )
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         width: 20,
//                       ),
//                     ])
//                   ],
//                 ),
//               ),
//             ],
//           );
//         });
//   }

//   //Botón crear producto
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: NavigationDrawer(),
//       appBar: AppBar(
//         backgroundColor: Colors.grey.shade900,
//       ),
//       body: Center(
//         child: Container(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 child: FlatButton.icon(
//                   icon: Icon(
//                     CupertinoIcons.flag,
//                     color: Colors.white,
//                   ),
//                   label: Text("Nuevo Producto"),
//                   color: Colors.yellow,
//                   onPressed: () async {
//                     await ShowInfoDialog(context);
//                   },
//                   shape: StadiumBorder(),
//                   highlightColor: Colors.yellow,
//                 ),
//               ),

//               //Tabla de productos
//               //ProductTable(),
//               DataTable(
//                 sortColumnIndex: 0,
//                 columns: <DataColumn>[
//                   DataColumn(
//                       label: IconButton(
//                     onPressed: () {
//                       // Navigator.pushNamed(context, '/productos');

//                       print(_vendedoresList.length);
//                       setState(() {});
// //Limpiar toda la tabla de productos
// // Operation().clearTable();
//                     },
//                     icon: Icon(Icons.local_activity),
//                     color: Colors.black,
//                   )),
//                   DataColumn(
//                       label: Text("Nombre Producto"),
//                       tooltip: "Nombre Producto",
//                       numeric: true,
//                       onSort: (int columnIndex, bool ascending) {}),
//                   DataColumn(
//                       label: Text("Codigo"),
//                       tooltip: "Codigo",
//                       numeric: true,
//                       onSort: (int columnIndex, bool ascending) {}),
//                   DataColumn(
//                       label: Text("Valor Ud"),
//                       tooltip: "Valor Ud",
//                       numeric: true,
//                       onSort: (int columnIndex, bool ascending) {}),
//                 ],
//                 rows: _vendedoresList.map((_productsList) {
//                   return DataRow(cells: [
//                     DataCell(Icon(Icons.delete), onTap: () {
//                       Operation().deleteProduct(_vendedoresList.);
//                       // setState(() {
                        
//                       // });
//                     }),
//                     DataCell(
//                       Text('${_vendedoresList..toString()}'),
//                       showEditIcon: true,
//                       onTap: () {
//                         print(_productsList.codigo);
//                       },
//                     ),
//                     DataCell(Text('${_productsList.codigo.toString()}')),
//                     DataCell(
//                         Text('${_productsList.precioProducto.toString()}')),
//                   ]);
//                 }).toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
