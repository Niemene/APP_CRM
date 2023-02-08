import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Card(
          
          child: Column(
            children: <Widget>[
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://www.wifinetcom.net/wp-content/uploads/2022/11/SCatena-finalmente-il-tuo-Potenziale-A-soli-E2990.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                title: Text("TITLE$index"),
                subtitle: Text("Description$index"),
              ),
              ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('Details'),
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
