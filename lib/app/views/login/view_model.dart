import 'package:flutter/material.dart';

import '../../../api/api.dart';
import '../../app.dart';

class LoginViewModel extends ChangeNotifier {
  Future<void> signInWithGoogle() async {
    await Authentication().signInWithGoogle();
  }

  Future<void> addUser() async {
    await FireStoreApi().addUser();
  }

  onPressGoogle(context) {
    signInWithGoogle().whenComplete(() => addUser()
        .whenComplete(() => Navigator.pushNamed(context, RoutePaths.tabs)));
  }
}
