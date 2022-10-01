import 'package:flutter/material.dart';

import '../../app.dart';

class LoginViewModel extends ChangeNotifier {
  Future<void> signInWithGoogle() async {
    await Authentication().signInWithGoogle();
  }

  onPressGoogle(context) {
    signInWithGoogle();
    Navigator.pushNamed(context, RoutePaths.home);
  }
}
