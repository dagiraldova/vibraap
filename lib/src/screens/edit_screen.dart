// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditPage extends StatelessWidget {
  static const String routeName = '/edit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.only(left: 20.0, top: 20.0),
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.flag,
                    size: 35.0,
                    color: Colors.yellow,
                  ),
                  Text(
                    '    N° de pedido',
                    style: TextStyle(
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  ),
                  Text(
                    ' 5614987345',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  )
                ],
              ),
            ),
            _usuario(context),
            _mesa(context)
          ]))
        ],
      ),
    );
  }

  Widget _usuario(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.0, top: 30.0),
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Text('Usuario',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0))
            ],
          ),
        ),
        Container(
          width: 170,
          height: 40,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 20, top: 16),
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(234, 236, 239, 1.0)),
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.yellow),
          child: Row(
            children: [
              Text('        3117072456',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                  ))
            ],
          ),
        )
      ],
    );
  }

  Widget _mesa(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20.0, top: 10.0),
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              Text('Mesa',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0))
            ],
          ),
        ),
        Container(
          width: 170,
          height: 40,
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 40, top: 7),
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(234, 236, 239, 1.0)),
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.yellow),
          child: Row(
            children: [
              Text('        4',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                  ))
            ],
          ),
        )
      ],
    );
  }

  Widget _producto(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('TOTAL', style: Theme.of(context).textTheme.headline1),
              Text("Subtotal: 89.000",
                  style: Theme.of(context).textTheme.subtitle1),
              Text("Iva: 9.500", style: Theme.of(context).textTheme.subtitle1),
              Text("Total: 99.000",
                  style: Theme.of(context).textTheme.subtitle1)
            ],
          ),
        ),
        Expanded(
            child: Container(
          height: 50,
          child: RaisedButton(
            child: Text("MODIFICAR"),
            onPressed: () {},
            color: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
          ),
        ))
      ],
    );
  }
}
