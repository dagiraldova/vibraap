// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/screens/products_screen.dart';

class Orders {
  final String codigo;
  final String item;
  final String cantidad;
  final String valorUd;
  final String subTotal;

  Orders(
    this.codigo,
    this.item,
    this.cantidad,
    this.valorUd,
    this.subTotal,
  );
}

final List<Orders> _ordersList = [
  Orders('codigo', '2', '2', '2', '5'),
  Orders('51231', 'Hamburguesa', '2', '2000', '4000')
];

class OrderTable extends StatefulWidget {
  const OrderTable({Key? key}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<OrderTable> {
  @override
  Widget build(BuildContext context) {
    return DataTable(
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
            label: Text("Codigo"),
            tooltip: "Codigo",
            numeric: true,
            onSort: (int columnIndex, bool ascending) {}),
        DataColumn(label: Text("Item"), tooltip: "Item"),
        DataColumn(
            label: Text("Cantidad"),
            tooltip: "Cantidad",
            numeric: true,
            onSort: (int columnIndex, bool ascending) {}),
        DataColumn(
            label: Text("Valor Ud"),
            tooltip: "Valor Ud",
            numeric: true,
            onSort: (int columnIndex, bool ascending) {}),
        DataColumn(
            label: Text("SubTotal"),
            tooltip: "SubTotal",
            numeric: true,
            onSort: (int columnIndex, bool ascending) {}),
      ],
      rows: _ordersList.map((_orderList) {
        return DataRow(cells: [
          DataCell(Text('')),
          DataCell(Text(_orderList.codigo)),
          DataCell(Text(_orderList.item)),
          DataCell(Text(_orderList.cantidad)),
          DataCell(Text(_orderList.valorUd)),
          DataCell(Text(_orderList.subTotal)),
        ]);
      }).toList(),
    );
  }
  //row data
}
