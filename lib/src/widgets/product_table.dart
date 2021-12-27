import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/db/db_provider.dart';
import 'package:flutterchat_app/src/db/repository.dart';
import 'package:flutterchat_app/src/model/producto.dart';
import 'package:flutterchat_app/src/screens/products_screen.dart';
import 'package:flutterchat_app/src/db/operation.dart';

class ProductTable extends StatefulWidget {
  // const ProductTable({Key? key}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();

}

class _TablePageState extends State<ProductTable> {
  //Operation db = DBProvider();
 List<Producto> _productsList = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    var productsList = await Operation().productos();
    print(productsList.length);
    _productsList.addAll(productsList);
    return _productsList;
  }

  


  @override
  Widget build(BuildContext context) {
    return DataTable(
      sortColumnIndex: 0,
      columns: <DataColumn>[
        DataColumn(
            label: IconButton(
          onPressed: () {
            //Navigator.pushNamed(context, '/productos');
            print(_productsList.length);
                      setState(() {});
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
                    DataCell(Icon(Icons.add), onTap: () {
                      print("Agregar producto");
                      // setState(() {
                        
                      // });
                    }),
                    DataCell(
                      Text('${_productsList.nombreProducto.toString()}'),
                      showEditIcon: true,
                      onTap: () {
                        print(_productsList.codigo);
                      },
                    ),
                    DataCell(Text('${_productsList.codigo.toString()}')),
                    DataCell(
                        Text('${_productsList.precioProducto.toString()}')),
                  ]);
                }).toList(),
    );
  }
  //row data
}
