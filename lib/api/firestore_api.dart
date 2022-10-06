import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../app/app.dart';

class FireStoreApi {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<User?> addUser() async {
    final _firebaseAuth = FirebaseAuth.instance;
    user = _firebaseAuth.currentUser!;
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
        'name': user!.displayName,
        'gmail': user!.email,
        'dP': user!.photoURL,
        'uid': user!.uid,
      }).catchError(
        (error) => throw FirebaseException(
          code: "$error",
          plugin: 'Adding user failed as : $error',
        ),
      );
      return user;
    } else {
      throw FirebaseException(
        code: "ERROR_ABORD",
        plugin: 'Adding user aborted by user',
      );
    }
  }

  Future<void> addPost(var postURL) async {
    if (user != null) {
      await FirebaseFirestore.instance.collection('posts').doc().set({
        'post': postURL,
        'time': DateTime.now(),
        'name': user!.displayName,
        'dP': user!.photoURL,
        'uid': user!.uid,
      }).catchError(
        (error) => throw FirebaseException(
          code: "$error",
          plugin: 'Failed to add post: $error',
        ),
      );
    }
  }

  Future<void> uploadFile(String filePath, String fileName) async {
    File file = File(filePath);

    try {
      firebase_storage.TaskSnapshot uploadTask =
          await storage.ref('files/$fileName').putFile(file);
      var downloadUrl = await (uploadTask).ref.getDownloadURL();
      addPost(downloadUrl);
    } on firebase_storage.FirebaseException catch (e) {
      FirebaseException(
        code: "$e",
        plugin: 'Failed upload post: $e',
      );
    }
  }
}
