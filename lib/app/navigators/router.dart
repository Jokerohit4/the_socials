import 'package:flutter/material.dart';
import 'package:the_socials/app/app.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
        );
      case RoutePaths.login:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );
      case RoutePaths.home:
        return MaterialPageRoute(
          builder: (_) => HomeView(),
        );
      case RoutePaths.friendlist:
        return MaterialPageRoute(
          builder: (_) => FriendListView(),
        );
    }
    return MaterialPageRoute(
      // builder: (_) => PageNotFound(),
      builder: (_) => const Text(
        'Replace with page not found',
      ),
    );
  }
}
