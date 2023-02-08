import 'package:flutter/material.dart';
import 'package:new_app_wfn/main.dart';
import 'package:intl/intl.dart';
import 'package:new_app_wfn/screen/info_page.dart';

import '../model/models.dart';

class collabCard extends StatelessWidget {


  collabCard({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Container(

  );

  }
}

Widget _buildTitle(contract){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          Text(contract["description"]),
          Spacer(),
          Text("Dal " + DateFormat.yMd().format(DateTime.parse(contract["startdate"])),style: TextStyle(fontSize: 12)),
        ],
      ),
      SizedBox(height: 20,),
    Row(
      children: <Widget>[
        Text("ULTIMO PAGAMENTO:" + DateFormat.yMd().format(DateTime.parse(contract["startdate"])), style: TextStyle(fontSize: 12)),

      ],
  )
    ],
  );
}
