import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  final contractToGo = "";
  const InfoPage({Key? key, required contractToGo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CONTRATTO")),
      body: Center(
          child: Text(
          contractToGo.toString(),
          style: TextStyle(
          color: Colors.black,
        ),
      )),
    );
  }
}
