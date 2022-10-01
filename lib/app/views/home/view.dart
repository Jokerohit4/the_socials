import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_socials/app/app.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final _viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: DSColors.backgroundBodyGrey,
        appBar: CustomAppBar(
          title: Text('THE SOCIALS'),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.messenger_outline,
                color: DSColors.bodyLight,
              ),
              onPressed: () {
                _viewModel.goToChat(context);
              },
            ),
          ],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (ctx, index) => Container(
                margin: EdgeInsets.symmetric(),
              ),
            );
          },
        ),
      );
}
