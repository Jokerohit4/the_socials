import 'package:flutter/material.dart';

import '../../app.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _viewModel = SplashViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel.startSplash(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          width: DSSizes.xxl,
          height: DSSizes.xxl,
          image:
              NetworkImage('https://cdn.logo.com/hotlink-ok/logo-social.png'),
        ),
      ),
    );
  }
}
