import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:new_app_wfn/screen/home_screen.dart';
import 'package:new_app_wfn/widget/custom_text_field.dart';
import 'package:new_app_wfn/widget/loading_dialog.dart';

import '../main.dart';
import '../model/models.dart';


class authScreen extends StatefulWidget {
  @override
  _authScreenState createState() => _authScreenState();
}

class _authScreenState extends State<authScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> fetchData(emailCheckedIfIsNotEmpty, passwordCheckedIfIsNotEmpty) async {
    try {
      var response = await http.post(
          Uri.parse(dotenv.env['API_AUTHUSER'].toString()),
          headers: {
            HttpHeaders.authorizationHeader: dotenv.env['API_KEY'].toString(),
          },
          body: {
            "username": emailCheckedIfIsNotEmpty,
            "password": passwordCheckedIfIsNotEmpty
          });
      if (response.statusCode == 200) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return LoadingDialogWidget(
                message: "RECUPERO DATI UTENTE",
              );
            });
        var responseUser= jsonDecode(response.body);
        print(responseUser['user']);
        utente= User.fromJson(responseUser['user']);
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return LoadingDialogWidget(
                  message: "RECUPERO CONTRATTI",
                );
              });
        });
        await utente.fetchContracts();
        //   await utente.fetchInvoices();
        Future.delayed(const Duration(seconds: 4), () {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return LoadingDialogWidget(
                  message: "RECUPERO SERVIZI",
                );
              });
        });
        for (var contract in utente.contracts) {
          await contract.fetchServices();
        }
        Future.delayed(const Duration(seconds: 6), () {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return LoadingDialogWidget(
                  message: "RECUPERO DISPOSITIVI",
                );
              });
        });

        for (var contract in utente.contracts) {
          for (var service in contract.services) {
            await service.fetchDevices();
          }
        }
        Future.delayed(const Duration(seconds: 8), () {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return LoadingDialogWidget(
                  message: "DATI CARICATI!",
                );
              });
        });

        Future.delayed(const Duration(seconds: 10), () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        });
      } else {
        Fluttertoast.showToast(msg: "ERRORE NEL CARICAMENTO DEI DATI");
      }
    } catch (e) {
      //SERVER DOWN
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:  AssetImage("asset/register.png"),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
           child: Column(
                children: [
                          Image.asset(
                    "asset/logo.png",
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          textEditingController: emailTextEditingController,
                          iconData: Icons.email,
                          hintText: "Email",
                          isObsecre: false,
                          enabled: true,
                        ),
                        CustomTextField(
                          textEditingController: passwordTextEditingController,
                          iconData: Icons.lock,
                          hintText: "Password",
                          isObsecre: true,
                          enabled: true,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 12),
                      ),
                      onPressed: () {
                        fetchData(emailTextEditingController.text.trim(), passwordTextEditingController.text.trim());
                      },
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
               const  SizedBox(height: 30),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                          child: (
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.teal,
                                ),
                                onPressed: () {
                                },
                                child: const Text(
                                  "PASSWORD DIMENTICATA",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                            )
                           ),
                        ),
                      ),
                     const  Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20.0, top: 20.0),
                          child: (
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.teal,
                                ),
                                onPressed: () {
                                },
                                child: const Text(
                                  "REGISTRATI",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ))
                               ),
                        ),
                      )
                    ],
                  )
                ],
              ),
          ),
        ),
      ),
    );
  }
}
