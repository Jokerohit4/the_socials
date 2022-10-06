import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../api/api.dart';

class TabsViewModel extends ChangeNotifier {
  //adds the user
  Future<User?> addUser() async {
    return FireStoreApi().addUser();
  }
}
