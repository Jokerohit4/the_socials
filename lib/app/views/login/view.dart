import 'package:flutter/material.dart';
import 'package:the_socials/app/widget/google_button.dart';

import '../../app.dart';

class LoginView extends StatelessWidget {
  final _viewModel = LoginViewModel();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Center(
            child:
                GoogleButton(onPressGoogle: _viewModel.onPressGoogle(context))),
      );
}
