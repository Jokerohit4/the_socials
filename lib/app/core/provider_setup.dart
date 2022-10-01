import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../app.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider.value(
    value: SplashViewModel(),
  ),
  ChangeNotifierProvider.value(
    value: LoginViewModel(),
  ),
  ChangeNotifierProvider.value(
    value: HomeViewModel(),
  ),
];

/*
class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
*/
