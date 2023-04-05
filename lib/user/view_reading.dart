import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class view_reading extends StatefulWidget {
  const view_reading({Key? key}) : super(key: key);

  @override
  State<view_reading> createState() => _view_readingState();
}

class _view_readingState extends State<view_reading> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey, Colors.blueAccent],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: 150,
                  width: double.maxFinite,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText(
                        'READING',
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),

                    ],
                    repeatForever: true,
                    pause: Duration(microseconds: 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Text(
                        'Consumer ID',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          '63d4sgry78hbte576mbb7e',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      )),
                ),
                /*TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.orange)),
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  ),
                ),*/

                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Customer Name',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          'Rohan',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Amount',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                Container(
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          '1000',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
