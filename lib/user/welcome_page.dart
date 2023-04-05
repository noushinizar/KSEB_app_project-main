import 'package:flutter/material.dart';
import 'package:kseb_project/kseb/kseb_home.dart';
import 'package:kseb_project/user/home_page.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'login_page.dart';

import 'register_page.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Image(image: AssetImage('images/govt logo.png')),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText(
                        'WELCOME',
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontFamily: 'ArchivoBlack',
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple[900]),
                      ),
                    ],
                    repeatForever: true,
                    pause: Duration(microseconds: 10),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: GradientText('KERALA STATE ELECTRICITY BOARD',
                      style: TextStyle(
                        fontFamily: 'ArchivoBlack',
                        fontSize: 17,
                      ),
                      colors: [
                        Colors.blueAccent,
                        Colors.black,
                        Colors.blueAccent,
                      ]),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.teal[800],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Stack(
                    children: [
                      Icon(
                        Icons.lock_reset_outlined,
                        color: Colors.tealAccent,
                        size: 180,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 200, right: 10, top: 36),
                        child: Container(
                          height: 50,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.tealAccent,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>  Login(),
                                  ));
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 200, right: 10, top: 96),
                        child: Container(
                          height: 50,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.tealAccent,
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Register(),
                                  ));
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
