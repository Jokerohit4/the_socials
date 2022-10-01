import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../app.dart';

class LoginView extends StatelessWidget {
  final _viewModel = LoginViewModel();

  LoginView({Key? key}) : super(key: key);
  Widget googleButton(BuildContext context) {
    return SizedBox(
      width: DSSizes.xxxl,
      height: DSSizes.xl,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            primary: DSColors.secondaryDark,
            onPrimary: DSColors.secondaryLight,
            shadowColor: Colors.blue,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                FontAwesomeIcons.google,
                color: Colors.white,
              ),
              Text(
                'LOGIN',
                style: TextStyle(
                    letterSpacing: DSSizes.xxs,
                    color: Colors.white,
                    fontSize: DSSizes.md),
              )
            ],
          ),
          onPressed: () {
            _viewModel.onPressGoogle(context);
          }),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: Center(child: googleButton(context)),
      );
}
