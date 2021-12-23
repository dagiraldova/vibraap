import 'package:flutter/cupertino.dart';
import 'package:flutterchat_app/src/db/db_provider.dart';
import 'package:flutterchat_app/src/model/producto.dart';

class Repository {
  static final Repository _repository = new Repository();
  //final DBProvider _dbProvider = DBProvider.get();

  static Repository get(){
    return _repository;
  }

  Future<List<Producto>?> fetchProductos() async {
    //List<Producto>? productsList = await _dbProvider.fetchProductos();

    //return productsList;
  }
}
