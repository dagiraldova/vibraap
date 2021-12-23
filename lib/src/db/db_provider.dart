import 'package:flutter/material.dart';
import 'package:flutterchat_app/src/model/producto.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:path/path.dart';

class DBProvider {
  late Database db;
  static final DBProvider _dbProvider = new DBProvider();

  static DBProvider get(){
    return _dbProvider;
  }

  DBProvider() {
    init();
  }


  init() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "Restaurante.db");
    db = await openDatabase(path, version: 1,
        onCreate: (Database newDB, int version) {
      //Crear tabla productos
      newDB.execute("""
      CREATE TABLE productos
      (
        codigo INTEGER PRIMARY KEY,
        nombreProducto TEXT,
        valorProducto INTEGER
      )
      """);
    });
  }

  //Obtener productos por idProducto
  Future<List<Producto>?> fetchProductos() async {
    var maps = await db.query(
      'productos',
    );
    if (maps.length > 0) {
      return maps.map<Producto>((item) => new Producto.fromDb(item)).toList();
    } else {
      return null;
    }
  }

  Future<List<Producto>?> fetchProductoId(int codigo) async {
    var maps = await db.query('productos',
        columns: null, where: "codigo = ?", whereArgs: [codigo]);
    if (maps.length > 0) {
      return maps.map<Producto>((item) => new Producto.fromDb(item)).toList();
    } else {
      return null;
    }
  }

  void addProducto(Producto producto) {
    db.insert('productos', producto.toMap(),
        conflictAlgorithm: ConflictAlgorithm.fail);
  }
}
