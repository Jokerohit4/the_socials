import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:the_socials/app/app.dart';

class HomeView extends StatelessWidget {
  HomeView({
    Key? key,
  }) : super(key: key);
  final Stream<QuerySnapshot> _postsStream =
      FirebaseFirestore.instance.collection('posts').snapshots();
  final _viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: DSColors.backgroundBodyGrey,
        appBar: CustomAppBar(
          title: Text(appTitle),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.logout_outlined,
                color: DSColors.bodyLight,
              ),
              onPressed: () {
                _viewModel.onPressSignOut(context);
              },
            ),
          ],
        ),
        body: StreamBuilder(
          stream: _postsStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }
            if (snapshot.hasData == false) {
              return const Center(child: Text('No Posts Yet'));
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
                return Post(
                  data: data,
                );
              }).toList(),
            );
          },
        ),
      );
}
