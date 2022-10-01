import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../app.dart';

class SplashViewModel extends ChangeNotifier {
  // final SharedDataViewModel _sharedDataViewModel = SharedDataViewModel();
  final user = FirebaseAuth.instance.currentUser;
  _continue({required BuildContext context}) async {
    Navigator.of(context).popUntil((route) => route.isFirst);
    print(user);
    if (user == null)
      Navigator.of(context).pushReplacementNamed(
        RoutePaths.login,
      );
    else
      Navigator.of(context).pushReplacementNamed(
        RoutePaths.home,
      );
  }

  Future<void> startSplash({required BuildContext context}) async {
    _continue(context: context);
  }
}
