import 'package:flutter/material.dart';

class MyDropdownButton extends StatefulWidget {
  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  String? _selectedItem;
  List<String> _items = ['INTERNET', 'VOIP', 'VPN & CLOUD','HOSTING'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      style: TextStyle(color: Colors.black, fontSize: 18),
      items: _items.map((String item) {
        return DropdownMenuItem<String>(

          value: item,
          child: Text(item),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedItem = newValue;
        });
      },
      value: _selectedItem,
      hint: Text('QUALE SERVIZIO?', style: TextStyle(color: Colors.black, fontSize: 18)),
    );
  }
}