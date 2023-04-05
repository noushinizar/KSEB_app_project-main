import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kseb_project/kseb/kseb_home.dart';

import '../user/welcome_page.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image(
        image: AssetImage('images/kseb.jpg'),
      )),
    );
  }

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => welcome(),
            )));
  }
}
