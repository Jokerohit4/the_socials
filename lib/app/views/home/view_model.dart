import 'package:flutter/material.dart';
import 'package:the_socials/app/app.dart';

class HomeViewModel extends ChangeNotifier {
  goToChat(context) {
    Navigator.pushNamed(context, RoutePaths.friendlist);
  }
}
