import 'package:estructura_practica_1/login/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:estructura_practica_1/utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'OpenSansRegular'),
      title: APP_TITLE,
      home: SplashScreen(),
    );
  }
}
