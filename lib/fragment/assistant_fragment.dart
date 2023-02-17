import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:http/http.dart' as http;
import 'package:new_app_wfn/main.dart';
import 'package:new_app_wfn/widget/dropdownCustom.dart';

import '../widget/custom_text_field.dart';
class AssistantFragment extends StatelessWidget {

  const AssistantFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController problemMessage = TextEditingController();

    return SingleChildScrollView(
      child: Column(
        children: [
             Card(
               color: Colors.teal,
               margin: EdgeInsets.all(10),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        "PROBLEMI?",
                        style: TextStyle(fontSize: 18,fontFamily: "Times New Roman",)
                        ,
                      ),
                      MyDropdownButton(),
                    ],
                  ),

                  Image(
                    image: AssetImage("asset/wireless.png"),
                    width: 120,
                    height: 120,
                  ),
                ],
            ),
             ),


            CustomTextField(
            textEditingController: problemMessage,
            iconData: Icons.question_mark,
            hintText: "PROBLEMA",
            isObsecre: false,
            enabled: true,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.teal,
                padding: const EdgeInsets.symmetric(
                    horizontal: 50, vertical: 12),
              ),
              onPressed: () {sendEmail(message: problemMessage.text.trim());  },
              child: const Text(
                "INVIA",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),


    );
  }
}
Future sendEmail({
  required String message,
}) async{
  final serviceId ='service_vk4b40e';
  final templateId = 'template_3hhbcvp';
  final userId = '5d2GPYbK86kgEqvjV';
  final accessToken = 'h_jx19u4h4cWZy96mAyTM';

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(
      url,
    headers: {
        'Content-Type' : 'application/json',
    },
    body: jsonEncode({
        'service_id': serviceId,
      'template_id' : templateId,
      'user_id' : userId,
      'accessToken' : accessToken,
      'template_params' :{
          'user_name' : utente.firstname +' ' +utente.lastname,
          'user_email' : utente.email,
          'user_message' : message,
      }
    }),
  );

  print(response.body);
}

