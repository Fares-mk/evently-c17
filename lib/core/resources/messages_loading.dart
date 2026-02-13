import 'package:flutter/material.dart';

class MessagesLoading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircularProgressIndicator(),
              SizedBox(width: 8,),
              Text("Loading....")
            ],
          )
        ],
      ),
    );
  }
}
