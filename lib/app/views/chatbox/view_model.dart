import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

class ChatBoxViewModel extends ChangeNotifier {
  onSendMessage(
      String chatRoomId, TextEditingController _message, var _firestore) async {
    if (_message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": user!.displayName,
        "message": _message.text,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
      };
      _message.clear();
      await _firestore
          .collection('chatroom')
          .doc(chatRoomId)
          .collection('chats')
          .add(messages);
    } else {
      throw FirebaseException(
        code: 'NO TEXT',
        plugin: 'Enter some text please',
      );
    }
  }
}
