import 'dart:async';

import 'package:estructura_practica_1/login/page_to_enter.dart';
import 'package:flutter/material.dart';

// ignore: unused_import
import '../utils/constants.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                PageToEnter() //builder: (context) => Home(title: APP_TITLE)
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/cafe.jpg"), fit: BoxFit.cover),
      ),
      child: Image(
        image: AssetImage('assets/cupping.png'),
      ),
    );
  }
}
