import 'dart:io';
import 'package:flutterchat_app/src/db/db_provider.dart';
import 'package:flutterchat_app/src/model/producto.dart';
import 'package:flutterchat_app/src/model/vendedor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Operation {
  //Es una operacion asincrona por esto utilizamos future, async, wait
  //static final Operation _singleton = Operation._internal();

  // factory Operation() {
  //   return _singleton;
  // }

  //Operation._internal();

  // Database db;


//Inicializar la base de datos del restaurante
  // Future<Database> _initDB() async {
  //   Directory documentsDirectory = await getApplicationDocumentsDirectory();
  //   String path = join(documentsDirectory.path, 'restaurante.db');
  //   return await openDatabase(path,
  //       version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
  // }

//Inicializar una db
  Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'Restaurante.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE productos (codigo INTEGER primary key autoincrement , nombreProducto TEXT, precioProducto INTEGER)",
      );
    }, version: 1);
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {}

  //Si es necesario cambiar el autoincrement para agregar códigos establecidos
  Future _onCreate(Database db, int version) async {
    return await db.execute(
        "CREATE TABLE productos (codigo INTEGER primary key autoincrement , nombreProducto TEXT, precioProducto INTEGER)");
  }

  Future saveData(Producto producto) async {
    var _db = await _openDB();
    return await _db.insert('productos', producto.toMap());
  }

//Alternativa para guardar producto
//  Future saveData(Producto producto) async {
//     var _db = await db;
//     return await _db.rawInsert('INSERT Into productos (codigo,nombreProducto,precioProducto) VALUES (?,?,?)', [producto.codigo,producto.nombreProducto,producto.precioProducto]);
//   }

//Buscar todos los productos y recuperar la tabla
//Alternativa 1
  // Future<List<Producto>> findAll() async {
  //   var _db = await db;
  //   List<Map<String, dynamic>> result = await _db.query('productos');

  //   return result.isNotEmpty
  //       ? result.map((e) {
  //           return Producto.fromDb(e);
  //         }).toList()
  //       : [];
  // }

//Alternativa 2
  Future<List<Producto>> productos() async {
    // Obtiene una referencia de la base de datos
    final Database _db = await _openDB();

    // Consulta la tabla por todos los pedidos.
    final List<Map<String, dynamic>> maps = await _db.query('productos');

    // Convierte List<Map<String, dynamic> en List<Pedidos>.
    return List.generate(maps.length, (i) {
      return Producto(
          codigo: maps[i]['codigo'],
          nombreProducto: maps[i]['nombreProducto'],
          precioProducto: maps[i]['precioProducto']);
    });
  }

  // Future<List<Producto>?> fetchProductos() async {
  //   var maps = await db.query(
  //     'productos',
  //   );
  //   if (maps.length > 0) {
  //     return maps.map<Producto>((item) => new Producto.fromDb(item)).toList();
  //   } else {
  //     return null;
  //   }
  // }

  // Future addProducto(Producto producto) {
  //   return db.insert('productos', producto.toMap(),
  //       conflictAlgorithm: ConflictAlgorithm.fail);
  // }

  // Future find(int codigo) async {
  //   var _db = await db;
  //   List<Map<String, dynamic>> result =
  //       await _db.query('productos', where: 'codigo = ?', whereArgs: [codigo]);

  //   return result.isNotEmpty
  //       ? result.map((e) {
  //           return Producto.fromDb(e);
  //         }).toList()
  //       : [];
  // }

  // Future<int> update(Producto producto) async {
  //   var _db = await db;
  //   return await _db.update('producto', producto.toJson(),
  //       where: 'codigo = ?', whereArgs: [producto.codigo]);
  // }

//Manejo base de datos vendedores
  // Future saveDataVendedor(Vendedor vendedor) async {
  //   var _db = await db;
  //   return await _db.insert('vendedores', vendedor.toMap());
  // }

  // Future _onCreateVendedor(Database db, int version) async {
  //   return await db.execute(
  //       "CREATE TABLE vendedores (codigoVendedor INTEGER primary key AUTOINCREMENT , nombreVendedor TEXT, telefonoVendedor INTEGER)");
  // }

  // Future findVendedor(int codigo) async {
  //   var _db = await db;
  //   List<Map<String, dynamic>> result =
  //       await _db.query('vendedores', where: 'codigo = ?', whereArgs: [codigo]);

  //   return result.isNotEmpty
  //       ? result.map((e) {
  //           return Vendedor.fromJsonVendedor(e);
  //         }).toList()
  //       : [];
  // }

  // Future<List<Vendedor>> findAllVendedores() async {
  //   var _db = await db;
  //   List<Map<String, dynamic>> result = await _db.query('vendedores');

  //   return result.isNotEmpty
  //       ? result.map((e) {
  //           return Vendedor.fromJsonVendedor(e);
  //         }).toList()
  //       : [];
  // }
}
