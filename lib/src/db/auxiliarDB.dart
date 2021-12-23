// onCreate: (Database newDB, int version) {
//       newDB.execute("""
//       CREATE TABLE productos
//       (
//         idProducto INTEGER PRIMARY KEY,
//         nombreProducto TEXT,
//         valorProducto INTEGER
//       )
//       """);
//     }


// //Vendedores
//     ("""
//       CREATE TABLE vendedores
//       (
//         idVendedor INTEGER PRIMARY KEY,
//         nombreVendedor TEXT,
//         telefonoVendedor INTEGER
//       )
//       """)
// }

// //Clientes
// ("""
//       CREATE TABLE clientes
//       (
//         idCliente INTEGER PRIMARY KEY,
//         nombreCliente TEXT,
//         correo INTEGER
//       )
//       """)
// }

// //ItemsPedidos
// ("""
//       CREATE TABLE items_pedidos
//       (
//         idItem INTEGER PRIMARY KEY,
//         cantidad INTEGER,
//         totalProducto INTEGER,
//         foreign key (idPedido) REFERENCES pedidos(idPedido),
//         foreign key (idProducto) REFERENCES productos(idProducto)
//       )
//       """)
// }

// //pedidos
// ("""
//       CREATE TABLE pedidos
//       (
//         idPedido INTEGER PRIMARY KEY,
//         precio INTEGER,
//         mesa INTEGER,
//         estado INTEGER,
//         fecha REAL,
//         foreign key (idCliente) REFERENCES clientes(idCliente),
//         foreign key (idVendedor) REFERENCES vendedores(idVendedor)
//       )
//       """)
// }


//       //Crear tabla vendedores
//       newDB.execute("""
//        CREATE TABLE vendedores
//        (
//          idVendedor INTEGER PRIMARY KEY,
//          nombreVendedor TEXT,
//          telefonoVendedor INTEGER
//        )
//        """);
//       //Crear tabla clientes
//       newDB.execute("""
//        CREATE TABLE clientes
//        (
//          idCliente INTEGER PRIMARY KEY,
//          nombreCliente TEXT,
//          correo INTEGER
//        )
//        """);
//       //Items Pedidos
//       newDB.execute("""
//        CREATE TABLE items_pedidos
//        (
//          idItem INTEGER PRIMARY KEY,
//          cantidad INTEGER,
//          totalProducto INTEGER,
//          foreign key (idPedido) REFERENCES pedidos(idPedido),
//          foreign key (idProducto) REFERENCES productos(idProducto)
//        )
//        """);
//        //pedidos
//        newDB.execute("""
// //       CREATE TABLE pedidos
// //       (
// //         idPedido INTEGER PRIMARY KEY,
// //         precio INTEGER,
// //         mesa INTEGER,
// //         estado INTEGER,
// //         fecha REAL,
// //         foreign key (idCliente) REFERENCES clientes(idCliente),
// //         foreign key (idVendedor) REFERENCES vendedores(idVendedor)
// //       )
// //       """
//        );