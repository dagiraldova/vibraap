//Creamos el modelo de productos para realizar la base de datos de productos
// ignore_for_file: unnecessary_string_interpolations, unnecessary_brace_in_string_interps

class Producto {
  late final int codigo;
  // late final String codigo;
  late final String nombreProducto;
  late final int precioProducto;
  // late final String precioProducto;

//Constructor producto
  Producto(
      {required this.codigo,
      required this.nombreProducto,
      required this.precioProducto});


  //Conversion de la base de datos al formato de productos
  Producto.fromDb(Map<String, dynamic> parsedJson) {
    nombreProducto = parsedJson['nombreProducto'];
    codigo = parsedJson['codigo'].toInt();
    precioProducto = parsedJson['precioProducto'].toInt();
  }

// Map para transformar el string que entra al tipo de dato de la db
  Map<String, dynamic> toMap() {
    return {
      'codigo': '${codigo}',
      'nombreProducto': '${nombreProducto}',
      'precioProducto': '${precioProducto}'
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codigo'] = codigo;
    data['nombreProducto'] = nombreProducto;
    data['precioProducto'] = precioProducto;
    return data;
  }
}
