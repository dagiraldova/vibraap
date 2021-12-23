//Creamos el modelo de productos para realizar la base de datos de productos
class Vendedor {
  late final int codigoVendedor;
  // late final String codigo;
  late final String nombreVendedor;
  late final int telefonoVendedor;
  // late final String precioProducto;

//Constructor producto
  Vendedor(
      {required this.codigoVendedor,
      required this.nombreVendedor,
      required this.telefonoVendedor});

Vendedor.fromJsonVendedor(Map<String, dynamic> json) {
    codigoVendedor = json['codigoVendedor'];
    nombreVendedor = json['nombreVendedor'];
    telefonoVendedor = json['telefonoVendedor'];
  }

// Map para transformar el string que entra al tipo de dato de la db
  Map<String, dynamic> toMap() {
    return {
      'codigoVendedor': '${codigoVendedor}',
      'nombreVendedor': '${nombreVendedor}',
      'telefonoVendedor': '${telefonoVendedor}'
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigoVendedor'] = codigoVendedor;
    data['nombreVendedor'] = nombreVendedor;
    data['telefonoVendedor'] = telefonoVendedor;
    return data;
  }
}
