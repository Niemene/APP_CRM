import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:led_bulb_indicator/led_bulb_indicator.dart';
import 'package:new_app_wfn/main.dart';

import '../model/models.dart';
import '../screen/contractDetailPage.dart';


class HomeFragment extends StatelessWidget {
  final List<Contract> contracts;
  const HomeFragment({Key? key, required this.contracts}) : super(key: key);

  @override
  

  Widget build(BuildContext context){
     return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Bentornato ${utente.firstname}',
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
               
                 Image(image: AssetImage("asset/195.png"), width: 120, height: 120,),
                ],
              ),
            ],
          ),
        ),
        Card(
          elevation: 7.0,
          color: Colors.cyan,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExpansionTile(
                  leading: const Icon(Icons.router),
                  title: const Text(
                    'INTERNET',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: LedBulbIndicator(
                    initialState: LedBulbColors.green,
                    glow: true,
                    size: 15,
                  ),
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.all(5),
                      shrinkWrap: true,
                      itemCount: contracts.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => _onCardTapped(context, index),
                          child: Card(
                            child: ListTile(
                              title: Text(contracts[index].address.toUpperCase()),
                            ),
                          ),
                        );
                      },
                    )
                  ]),
            ],
          ),
        ),
        Card(
          elevation: 7.0,
          color: Colors.indigo,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExpansionTile(
                  leading: const Icon(Icons.phone),
                  title: const Text(
                    'VOIP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: LedBulbIndicator(
                    initialState: LedBulbColors.red,
                    glow: true,
                    size: 15,
                  ),
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.all(5),
                      shrinkWrap: true,
                      itemCount: 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Card(
                            child: ListTile(
                              title: Text("VOIP $index"),
                            ),
                          ),
                        );
                      },
                    )
                  ]),
            ],
          ),
        ),
        Card(
          elevation: 7.0,
          color: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExpansionTile(
                  leading: const Icon(Icons.cloud_circle),
                  title: const Text(
                    'VPN & CLOUD',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: LedBulbIndicator(
                    initialState: LedBulbColors.red,
                    glow: true,
                    size: 15,
                  ),
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.all(5),
                      shrinkWrap: true,
                      itemCount: 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Card(
                            child: ListTile(
                              title: Text("VOIP $index"),
                            ),
                          ),
                        );
                      },
                    )
                  ]),
            ],
          ),
        ),
        Card(
          elevation: 7.0,
          color: Colors.lime,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ExpansionTile(
                  leading: const Icon(Icons.storage),
                  title: const Text(
                    'HOSTING',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: LedBulbIndicator(
                    initialState: LedBulbColors.red,
                    glow: true,
                    size: 15,
                  ),
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.all(5),
                      shrinkWrap: true,
                      itemCount: 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Card(
                            child: ListTile(
                              title: Text("HOSTING $index"),
                            ),
                          ),
                        );
                      },
                    )
                  ]),
            ],
          ),
        ),
        Card(
          elevation: 7.0,
          color: Colors.blueGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              ExpansionTile(
                  leading: const Icon(Icons.help),
                  title: const Text(
                    'ASSISTENZA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: LedBulbIndicator(
                    initialState: LedBulbColors.red,
                    glow: true,
                    size: 15,
                  ),
                  children: [
                    ListView.builder(
                      padding: const EdgeInsets.all(5),
                      shrinkWrap: true,
                      itemCount: 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Card(
                            child: ListTile(
                              title: Text("ASSISTENZA $index"),
                            ),
                          ),
                        );
                      },
                    )
                  ]),
            ],
          ),
        ),
      ],
    ));
  }
    void _onCardTapped(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContractDetailPage(contract: contracts[index]),
      ),
    );
  }
}