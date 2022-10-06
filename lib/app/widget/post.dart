import 'package:flutter/material.dart';
import 'package:the_socials/app/app.dart';

class Post extends StatelessWidget {
  const Post({Key? key, this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(DSSizes.md),
      child: Container(
        margin: const EdgeInsets.all(DSSizes.md),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1,
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(DSSizes.sm),
              child: ListTile(
                leading: Image.network(data['dP']),
                title: Text(data['name']),
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(DSSizes.lg),
                  ),
                ),
                child: Image.network(data['post']))
          ],
        ),
      ),
    );
  }
}
