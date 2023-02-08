import 'package:flutter/material.dart';
import 'package:new_app_wfn/main.dart';

class Invoices extends StatefulWidget {
  @override
  State<Invoices> createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
         
        Container(
          padding: EdgeInsets.all(5),
          child: Row(
          
            children: <Widget>[
            
              Expanded(
                child:InkWell(
                  child: const Icon(Icons.calendar_month_sharp),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context, 
                      initialDate: startDate, 
                      firstDate: DateTime(2020), 
                      lastDate: DateTime(2050),
                      );
                      if(date != null){
                        setState(() {
                          startDate = date;
                        });
                      }
                  },
                )
              ),
           
              Expanded(
              child: InkWell(
                child:const Icon(Icons.calendar_month_rounded,color: Colors.red),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context, 
                    initialDate: endDate, 
                    firstDate: DateTime(2020), 
                    lastDate: DateTime(2050),);
                    if(date != null){
                      setState(() {
                        endDate = date;
                      });
                    }
                },
              ),
              ),
                Expanded(
                  child: RaisedButton(
                child: const Text("Filtro"),
                onPressed: () {},
              )),
            ],
            
          ),
        ),
           Divider(height: 20, color: Colors.teal, thickness: 2, indent: 10, endIndent: 10, ),
          
        Expanded(
          child: ListView.builder(
                      itemCount: utente.invoiceEntry.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: Card(
                            child: ListTile(
                              dense: true,
                       
                              title: Text(utente.invoiceEntry[index].description),
                              trailing: Text("€${utente.invoiceEntry[index].price}"),
                              subtitle: const Text("Da pagare entro 22/02/2023"),
                            ),
                          ),
                        );
                      },
                    )
          ),
      ],
    );
  }
}
