class Cliente {
  final int idCliente;
  final String nombreCliente;
  final String correo;

  Cliente(this.idCliente, this.nombreCliente, this.correo);

  Map<String, dynamic> toMap(){
    return {'idCliente': idCliente, 'nombreCliente': nombreCliente, 'correo': correo};
  }
}