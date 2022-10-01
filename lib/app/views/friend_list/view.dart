import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../app.dart';

class FriendListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: DSColors.bodyLight,
        appBar: CustomAppBar(title: Text('THE FRIENDS LIST')),
        body: SafeArea(
          child: StreamBuilder<List<User>>(
            // stream: FirebaseApi.getUsers(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                default:
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return buildText('Something Went Wrong Try later');
                  } else {
                    final users = snapshot.data;

                    if (users == null) {
                      return buildText(
                        'NO USERS FOUND',
                      );
                    } else {
                      return Column(
                        children: [
                          ChatHeaderWidget(users: users),
                          ChatBodyWidget(users: users)
                        ],
                      );
                    }
                  }
              }
            },
          ),
        ),
      );

  Widget buildText(String text) => Center(
        child: Text(
          text,
          style: TextStyle(
              fontSize: DSSizes.md,
              color: DSColors.secondaryDark,
              letterSpacing: DSSizes.md),
        ),
      );
}
