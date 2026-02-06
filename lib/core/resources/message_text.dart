import 'package:flutter/material.dart';

class MessageText extends StatelessWidget {
  String message;

  MessageText({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(message),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text("ok")),
      ],
    );
  }
}
