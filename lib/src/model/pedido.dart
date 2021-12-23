import 'package:flutterchat_app/src/model/cliente.dart';

class Pedido {
  final int idPedido;
  final int idCliente;
  final int precio;
  final int mesa;
  final int idVendedor;
  final int estado;
  final DateTime fecha;

  Pedido(this.idPedido, this.idCliente, this.precio, this.mesa, this.idVendedor, this.estado, this.fecha);

  Map<String, dynamic> toMap(){
    return {'idPedido': idPedido, 'idCliente': idCliente, 'precio': precio, 'mesa': mesa, 'idVendedor': idVendedor, 'estado': estado, 'fecha': fecha,};
  }
}