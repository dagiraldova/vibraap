import 'package:flutterchat_app/src/model/producto.dart';
class ItemPedido {
  final int idItem;
  final int idPedido;
  final int idProducto;
  final int totalProducto;
  final int cantidad;

  ItemPedido(this.idItem, this.idPedido, this.idProducto, this.totalProducto, this.cantidad);

  Map<String, dynamic> toMap(){
    return {'idItem': idItem, 'idPedido': idPedido, 'idProducto': idProducto, 'totalProducto': totalProducto, 'cantidad': cantidad,};
  }
}