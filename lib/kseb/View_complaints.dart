import 'dart:core';
import 'dart:core';

import 'package:flutter/material.dart';
class View_complaint extends StatefulWidget {
  final String comptitle;
  final String Compdes;
  final String location;

  const View_complaint({required this.comptitle, required this.Compdes, required this.location});



  @override
  State<View_complaint> createState() => _View_complaintState();
}

class _View_complaintState extends State<View_complaint> {
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
        appBar: AppBar(
          backgroundColor:Colors.transparent ,
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               widget.comptitle,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                widget.Compdes
                ,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 28),
              Text(
              widget.location,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

