import 'package:firebase_auth/firebase_auth.dart';

class HelperFunctions {
  static var user = FirebaseAuth.instance.currentUser;
  static Future<bool?> getUserLoggedInStatus() async {
    if (user == null) {
      return false;
    } else
      return true;
  }
}
