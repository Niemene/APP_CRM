import 'package:flutter/material.dart';
class LoadingDialogWidget extends StatelessWidget {
  var message= '';
  @override
  LoadingDialogWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //CIRCULAR PROGRESS
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 14),
            child: const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.tealAccent),
            ),
          ),
          Text(
            message.toString(),
          )
        ],
      ),
    );
  }
}
