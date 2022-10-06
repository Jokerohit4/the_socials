import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../app.dart';

class ChatBodyWidget extends StatelessWidget {
  final firestore;
  final String chatRoomId;
  const ChatBodyWidget({
    Key? key,
    required this.firestore,
    required this.chatRoomId,
  }) : super(key: key);

  Widget messages(Size size, Map<String, dynamic> map, BuildContext context) {
    return Container(
      width: size.width,
      alignment: map['sendby'] == user!.displayName
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.blue,
        ),
        child: Text(
          map['message'],
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 1.3,
      width: size.width,
      child: StreamBuilder<QuerySnapshot>(
        stream: firestore
            .collection('chatroom')
            .doc(chatRoomId)
            .collection('chats')
            .orderBy("time", descending: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> map =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return messages(size, map, context);
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
