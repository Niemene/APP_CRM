import 'package:flutter/material.dart';
import 'package:led_bulb_indicator/led_bulb_indicator.dart';
import 'package:new_app_wfn/main.dart';
import 'package:new_app_wfn/screen/serviceInformation.dart';
import 'package:new_app_wfn/utils/customShape.dart';

import '../model/models.dart';

class ContractDetailPage extends StatelessWidget {
  final Contract contract;
  const ContractDetailPage({Key? key, required this.contract})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(contract.address.toUpperCase(),
            style: const TextStyle(fontSize: 15)),
        flexibleSpace: ClipPath(
            clipper: AppBarShape(),
            child: Container(
              color: Colors.teal,
            )),
      ),
      body: SingleChildScrollView(
        
        child:(
          Column(
          children:[
           const Divider(
              height: 5,
              color: Colors.teal,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Text(
                  "SERVIZI ATTIVI",
                  style: TextStyle(fontSize: 25),
                ),
                Image(
                  image: AssetImage("asset/contratti.png"),
                  width: 120,
                  height: 120,
                ),
              ],
            ),
           
            Container(
              height: 160,
              child: ListView.builder(
                itemCount: contract.services.length,
                itemBuilder: (context, index) {
                  Service service = contract.services[index];
                  return InkWell(
                    onTap: () => _onServiceTapped(context, index),
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      color: Colors.teal[200],
                      child: ListTile(
                        dense: true,
                        title: Text(service.description),
                        subtitle: Text(contract.address),
                        trailing: LedBulbIndicator(
                            initialState: LedBulbColors.green,
                            glow: true,
                            size: 15),
                      ),
                    ),
                  );
                },
              ),
            ),
           const Divider(
              height: 5,
              color: Colors.teal,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Text(
                  "FATTURE SERVIZIO",
                  style: TextStyle(fontSize: 25),
                ),
                Image(
                  image: AssetImage("asset/billings.png"),
                  width: 120,
                  height: 120,
                ),
              ],
            ),
            Container(
                height: 200,
                child: ListView.builder(
                  itemCount: utente.invoiceEntry.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        dense: true,
                        title: Text("FATTURA " +
                            utente.invoiceEntry[index].description),
                        trailing: Text("€${utente.invoiceEntry[index].price}"),
                        leading: LedBulbIndicator(
                            initialState: LedBulbColors.green,
                            glow: false,
                            size: 30),
                        subtitle: Text("Scade il " +
                            utente.invoiceEntry[index].id.toString() +
                            "1/01/2023"),
                      ),
                    );
                  },
                )),
            Divider(
              height: 20,
              color: Colors.teal,
              thickness: 2,
              indent: 40,
              endIndent: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "INFO AGGIUNTIVE",
                  style: TextStyle(fontSize: 15),
                ),
                Image(
                  image: AssetImage("asset/contracts.png"),
                  width: 120,
                  height: 120,
                ),
              ],
            ),
            Divider(
              height: 20,
              color: Colors.teal,
              thickness: 2,
              indent: 40,
              endIndent: 40,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                  Card(
                    color: Colors.teal,
                      child: Center(
                        child: Icon(Icons.picture_as_pdf, size: 50),
                      )
                  ),
                    Card(
                      color: Colors.teal,
                      child: const Center(
                        child: Icon(Icons.report_problem_outlined, size: 50),
                      )
                  ),
                   Card(
                      color: Colors.teal,
                      child: const Center(
                        child: Icon(Icons.report_problem_outlined, size: 50),
                      )
                  ),
                 
              ],
            )
          ],
        )),
      ),
    );
  }

  void _onServiceTapped(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            serviceInformation(serviceSelected: contract.services[index]),
      ),
    );
  }
}
