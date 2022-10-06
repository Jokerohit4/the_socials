import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../app.dart';

class FriendListView extends StatelessWidget {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  FriendListView({Key? key}) : super(key: key);

  String chatRoomId(String user1, String user2) {
    if (user1[0].toLowerCase().codeUnits[0] >
        user2.toLowerCase().codeUnits[0]) {
      return "$user1$user2";
    } else {
      return "$user2$user1";
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: DSColors.bodyLight,
        appBar: CustomAppBar(title: const Text('THE FRIENDS LIST')),
        body: SafeArea(
          child: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              }
              if (snapshot.hasData == false) {
                return const Center(child: Text('No users yet'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Image(
                          image: NetworkImage(
                            data['dP'],
                          ),
                          width: DSSizes.xl,
                          height: DSSizes.xl,
                        ),
                      ),
                      title: Text(
                        data['name'].toString().toUpperCase(),
                        style: const TextStyle(
                          color: DSColors.bodyLight,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      tileColor: DSColors.secondaryDark,
                      onTap: () {
                        String chatID = chatRoomId(user!.uid, data['uid']);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatBoxView(
                                name: data['name'],
                                chatRoomId: chatID,
                                user: user,
                              ),
                            ));
                      },
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ),
      );
}

Widget buildText(String text) => Center(
      child: Text(
        text,
        style: const TextStyle(
            fontSize: DSSizes.md,
            color: DSColors.secondaryDark,
            letterSpacing: DSSizes.md),
      ),
    );
