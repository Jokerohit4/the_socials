import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

class ChatBoxView extends StatelessWidget {
  final String name;
  final String chatRoomId;
  final User? user;
  ChatBoxView(
      {Key? key,
      required this.chatRoomId,
      required this.name,
      required this.user})
      : super(key: key);

  final ChatBoxViewModel _viewModel = ChatBoxViewModel();
  final TextEditingController _message = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChatBodyWidget(
                chatRoomId: chatRoomId,
                firestore: _firestore,
              ),
              MessageWidget(
                chatRoomId: chatRoomId,
                controller: _message,
                onSendMessage:
                    _viewModel.onSendMessage(chatRoomId, _message, _firestore),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
