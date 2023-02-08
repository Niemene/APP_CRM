import '../model/models.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:intl/intl.dart';

import '../utils/customShape.dart';

class serviceInformation extends StatelessWidget {
  final Service serviceSelected;
  serviceInformation({Key? key, required this.serviceSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          elevation: 0.0,
          flexibleSpace: ClipPath(
              clipper: AppBarShape(),
              child: Container(
                color: Colors.teal,
                child: Center(
                  child: Image.asset(
                    "./asset/logo.png",
                    scale: 5,
                  ),
                ),
              )),
        ),
        body: Container(
          color: Colors.teal,
          child: ClipPath(
            clipper: ShapeBottom(),
            child: Container(
              color:Colors.white,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 35),
                      title: Text("PARAMETRI DEL CONTRATTO"),
                      trailing: Image(image: AssetImage("asset/internet.png")),
                    ),
                  ),
                  Divider(
                      height: 15,
                      thickness: 2,
                      indent: 40,
                      endIndent: 40,
                      color: Colors.teal),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListTile(
                      tileColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      dense: true,
                      title: Text(serviceSelected.description),
                      subtitle: Text("ATTIVO DAL " +
                          DateFormat.yMd()
                              .format(DateTime.parse(serviceSelected.activeFrom))),
                      trailing: Text(serviceSelected.state.toUpperCase()),
                    ),
                  ),
                  Divider(
                      height: 15,
                      thickness: 2,
                      indent: 40,
                      endIndent: 40,
                      color: Colors.teal),
                  Card(
                    color: Colors.transparent,
                    elevation: 0,
                    child: Container(
                      height: 180,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                                child: SfRadialGauge(
                              title: GaugeTitle(text: "DOWNLOAD"),
                              axes: <RadialAxis>[
                                RadialAxis(
                                  axisLabelStyle:
                                      GaugeTextStyle(color: Colors.tealAccent),
                                  axisLineStyle: AxisLineStyle(thickness: 10),
                                  showTicks: false,
                                  showLabels: false,
                                  pointers: <GaugePointer>[
                                    NeedlePointer(
                                        value: 10,
                                        enableAnimation: true,
                                        needleStartWidth: 0,
                                        needleEndWidth: 5,
                                        needleColor: Colors.blue,
                                        knobStyle: KnobStyle(
                                            color: Colors.white,
                                            borderColor: Colors.blue,
                                            knobRadius: 0.06,
                                            borderWidth: 0.04),
                                        tailStyle: TailStyle(
                                            color: Colors.blue,
                                            width: 5,
                                            length: 0.15)),
                                    RangePointer(
                                      value: 10,
                                      width: 10,
                                      enableAnimation: true,
                                      color: Colors.tealAccent,
                                    )
                                  ],
                                  annotations: <GaugeAnnotation>[
                                    GaugeAnnotation(
                                      widget: Container(
                                        child: Text(
                                          /* serviceSelected.objData['parameters']
                                                  ['bandwidth_download'] + */
                                          '10 MB/S',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      angle: 90,
                                      positionFactor: 1,
                                    )
                                  ],
                                )
                              ],
                            )),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: (SfRadialGauge(
                                title: const GaugeTitle(text: "UPLOAD"),
                                axes: <RadialAxis>[
                                  RadialAxis(
                                    axisLabelStyle:
                                        GaugeTextStyle(color: Colors.tealAccent),
                                    axisLineStyle: AxisLineStyle(thickness: 10),
                                    showTicks: false,
                                    showLabels: false,
                                    pointers: <GaugePointer>[
                                      NeedlePointer(
                                          value:
                                              10 /* double.parse(
                                              serviceSelected.objData['parameters']
                                                  ['bandwidth_upload']) */
                                          ,
                                          enableAnimation: true,
                                          needleStartWidth: 0,
                                          needleEndWidth: 5,
                                          needleColor: Colors.blue,
                                          knobStyle: KnobStyle(
                                              color: Colors.white,
                                              borderColor: Colors.blue,
                                              knobRadius: 0.06,
                                              borderWidth: 0.04),
                                          tailStyle: TailStyle(
                                              color: Colors.blue,
                                              width: 5,
                                              length: 0.15)),
                                      RangePointer(
                                        value:
                                            10 /* double.parse(
                                            serviceSelected.objData['parameters']
                                                ['bandwidth_upload']) */
                                        ,
                                        width: 10,
                                        enableAnimation: true,
                                        color: Colors.tealAccent,
                                      )
                                    ],
                                    annotations: <GaugeAnnotation>[
                                      GaugeAnnotation(
                                        widget: Container(
                                          child: Text(
                                            /* serviceSelected.objData['parameters']
                                                    ['bandwidth_upload'] + */
                                            '10MB/S',
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ),
                                        angle: 90,
                                        positionFactor: 1,
                                      )
                                    ],
                                  )
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 35),
                    title: Text("ULTIMO AGGIORNAMENTO"),
                    trailing: Text(DateFormat.Hm().format(DateTime.now())),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                      child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: <Widget>[
                      Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          color: Colors.teal[300],
                          child: Center(
                            child: Container(
                              child: Icon(Icons.router, size: 50),
                            ),
                          )),
                      Card(
                        color: Colors.teal[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Center(
                            child: Container(
                              child: Icon(Icons.network_check_outlined, size: 50),
                            ),
                          )),
                      Card(
                        color: Colors.teal[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          child: Center(
                            child: Container(
                              child: Icon(Icons.report_problem_outlined, size: 50),
                            ),
                          )),
                    ],
                  ))
                ],
              ),
            ),
          ),
        ));
  }
}
