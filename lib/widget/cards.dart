import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:new_app_wfn/main.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyCards extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   // BankAccount user = box.get('bankData');

    return Padding(
      padding: const EdgeInsets.all(25),
      child: Container(
        width: 300,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.teal[900],
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
             "BENVENUTO ${utente.firstname}",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
         //   SizedBox(height: 5),
            Text("Ultimo accesso"),

        //    SizedBox(height: 10),
            Text(
              "IL tuoi contratti attivi: " + utente.contracts.length.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            /*  Text(
              descriptionContract,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex:2,
                  child:Container(
                    child: (
                        SfRadialGauge(
                          title: GaugeTitle(text: "DOWNLOAD"),
                          axes: <RadialAxis>[
                            RadialAxis(

                              axisLabelStyle: GaugeTextStyle(color: Colors.tealAccent),

                              axisLineStyle: AxisLineStyle(thickness: 10),
                              showTicks: false,
                              showLabels: false,
                              pointers: <GaugePointer>[
                                NeedlePointer(value: 50, enableAnimation: true,
                                    needleStartWidth: 0,
                                    needleEndWidth: 5, needleColor: Color(0xFFDADADA),
                                    knobStyle: KnobStyle(color: Colors.white, borderColor: Color(0xFFDADADA),
                                        knobRadius: 0.06,
                                        borderWidth: 0.04),
                                    tailStyle: TailStyle(color:Color(0xFFDADADA), width: 5,
                                        length: 0.15)
                                ),
                                RangePointer(
                                  value: 50,
                                  width: 10,
                                  enableAnimation: true,
                                  color: Colors.tealAccent,
                                )
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  widget: Container(
                                    child: Text(
                                      '50 MB/S',
                                      style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),
                                    ),
                                  ),
                                  angle: 90,
                                  positionFactor: 1,
                                )
                              ],
                            )
                          ],
                        )

                    ),
                  ),
                ),
                Expanded(
                  flex:2,
                  child:Container(
                    child: (
                        SfRadialGauge(
                          title: const GaugeTitle(text: "UPLOAD"),
                          axes: <RadialAxis>[
                            RadialAxis(

                              axisLabelStyle: GaugeTextStyle(color: Colors.tealAccent),

                              axisLineStyle: AxisLineStyle(thickness: 10),
                              showTicks: false,
                              showLabels: false,
                              pointers: <GaugePointer>[
                                NeedlePointer(value: 50, enableAnimation: true,
                                    needleStartWidth: 0,
                                    needleEndWidth: 5, needleColor: Color(0xFFDADADA),
                                    knobStyle: KnobStyle(color: Colors.white, borderColor: Color(0xFFDADADA),
                                        knobRadius: 0.06,
                                        borderWidth: 0.04),
                                    tailStyle: TailStyle(color:Color(0xFFDADADA), width: 5,
                                        length: 0.15)
                                ),
                                RangePointer(
                                  value: 50,
                                  width: 10,
                                  enableAnimation: true,
                                  color: Colors.tealAccent,
                                )
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                  widget: Container(
                                    child: Text(
                                      '50 MB/S',
                                      style: TextStyle(
                                          fontSize: 15, fontWeight: FontWeight.bold,color: Colors.white),
                                    ),
                                  ),
                                  angle: 90,
                                  positionFactor: 1,
                                )
                              ],
                            )
                          ],
                        )

                    ),
                  ),
                ),
              ],
            ),
            Card(
              color: Colors.teal,

              child: (
                  Container(
                    child: (

                        Text("PARAMETRI LINK",style: TextStyle(
                          color: Colors.white,
                        ),)
                    ),
                  )
              ),
            )
 */

          ],
        ),
      ),
    );
  }
}
