import 'dart:ffi';

import 'package:evently_c17/core/resources/message_text.dart';
import 'package:evently_c17/core/resources/messages_loading.dart';
import 'package:flutter/material.dart';

class DialogueUtilles {
  static void showDialgueLoading({required BuildContext context}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => MessagesLoading(),
    );
  }

  static void showDialogueMessage({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => MessageText(message: message),
    );
  }
}
