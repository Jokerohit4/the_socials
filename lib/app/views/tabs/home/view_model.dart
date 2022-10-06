import 'package:flutter/material.dart';
import 'package:the_socials/app/app.dart';

class HomeViewModel extends ChangeNotifier {
  Future<void> signOutFromGoogle() async {
    await Authentication().signOut();
  }

  onPressSignOut(context) {
    signOutFromGoogle();
    Navigator.pushNamed(context, RoutePaths.login);
  }
}
