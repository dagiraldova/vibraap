import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/db/db_provider.dart';
import 'package:flutterchat_app/src/db/repository.dart';
import 'package:flutterchat_app/src/model/producto.dart';
import 'package:flutterchat_app/src/screens/products_screen.dart';
import 'package:flutterchat_app/src/services/operation.dart';

class ProductTable extends StatefulWidget {
  // const ProductTable({Key? key}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();

}

class _TablePageState extends State<ProductTable> {
  //Operation db = DBProvider();
final List<Producto> _productsList = [];

void agregarProducto (Producto producto) {
    Operation().saveData(producto);
    _productsList.add(producto);
    setState(() {      
    });
  }
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
   var productsList = await Operation().productos();
    setState(() {
      productsList.addAll(_productsList);
    });
  }

  


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
            label: Text("Nombre Producto"),
            tooltip: "Nombre Producto",
            numeric: true,
            onSort: (int columnIndex, bool ascending) {}),
        DataColumn(
            label: Text("Código"),
            tooltip: "Código",
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
          //DataCell(Text('')),
          DataCell(Text('${_productsList.nombreProducto.toString()}')),
          DataCell(Text('${_productsList.codigo.toString()}')),
          DataCell(Text('${_productsList.precioProducto.toString()}')),
        ]);
      }).toList(),
    );
  }
  //row data
}
