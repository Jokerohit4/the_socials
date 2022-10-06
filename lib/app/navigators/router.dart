import 'package:flutter/material.dart';
import 'package:the_socials/app/app.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
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
      case RoutePaths.tabs:
        return MaterialPageRoute(
          builder: (_) => const TabsView(),
        );
    }
    return MaterialPageRoute(
      builder: (_) => const Text(
        'Replace with page not found',
      ),
    );
  }
}
