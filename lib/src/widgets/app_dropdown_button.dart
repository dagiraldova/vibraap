// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class AppDropDownButton extends StatefulWidget {
  final List<String> items;
  final String view;

  const AppDropDownButton({Key? key, required this.items, required this.view})
      : super(key: key);

  @override
  _AppDropDownButtonState createState() => _AppDropDownButtonState();
}

class _AppDropDownButtonState extends State<AppDropDownButton> {
  @override
  Widget build(BuildContext context) {
    String _vista = widget.view;
    var _items = widget.items;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey.shade400)),
      child: DropdownButton(
        underline: SizedBox(),
        items: _items.map((String a) {
          return DropdownMenuItem(value: a, child: Text(a));
        }).toList(),
        onChanged: (_value) => {
          setState(() {
            _vista = _value as String;
          })
        },
        hint: Text(_vista),
      ),
    );
  }
}
