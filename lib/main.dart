import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';

//things that could be done better if more tine was provided

/*
this branch works perfectly but isn't very well structured
the other branch is.Please do check that out too
proper commenting isn't done
provider could be used on the tabsview page
Imagepicker cane be used to pick camera image
test cases could be written
structure could be btter
push notifications could be better implemented
*/
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // final cameras = await availableCameras();
  //final frontCamera = cameras[1];
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'the_socials',
        home: LoginView(),
        initialRoute: RoutePaths.login,
        onGenerateRoute: MyRouter.generateRoute,
        theme: ThemeData(
          primarySwatch: Colors.red,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
      ),
    );
  }
}
