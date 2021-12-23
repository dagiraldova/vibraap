// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({Key? key}) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  final _mesas = ['1', '2', '3', '4'];
  String? _vista = 'Mesa';

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 33,
        width: 130,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.yellow.shade600,
            borderRadius: BorderRadius.circular(20)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            alignment: Alignment.centerRight,
            dropdownColor: Colors.yellow.shade600,
            items: _mesas.map((String a) {
              return DropdownMenuItem(value: a, child: Text(a));
            }).toList(),
            onChanged: (_value) => {
              setState(() {
                _vista = _value as String?;
              }),
            },
            hint: Text(_vista!),
            style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold),
            icon: Icon(Icons.keyboard_arrow_down_outlined),
            iconEnabledColor: Colors.black,
          ),
        ));
  }
}
