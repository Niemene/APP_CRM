import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyChatbotScreen extends StatefulWidget {
  @override
  _MyChatbotScreenState createState() => _MyChatbotScreenState();
}

class _MyChatbotScreenState extends State<MyChatbotScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child:InAppWebView(
          initialFile: 'asset/chatbot.html',
          ),
    );
  }
}
