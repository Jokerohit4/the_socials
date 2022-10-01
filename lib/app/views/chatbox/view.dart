import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

class ChatBoxView extends StatefulWidget {
  final User user;

  const ChatBoxView({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  _ChatBoxViewState createState() => _ChatBoxViewState();
}

class _ChatBoxViewState extends State<ChatBoxView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.blue,
        body: SafeArea(
          child: Column(
            children: [
              ProfileHeaderWidget(
                  name: FirebaseAuth.instance.currentUser!.displayName!),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: MessagesWidget(
                      idUser: FirebaseAuth.instance.currentUser!.uid),
                ),
              ),
              NewMessageWidget(idUser: FirebaseAuth.instance.currentUser!.uid)
            ],
          ),
        ),
      );
}
