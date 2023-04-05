import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kseb_project/API_service/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Kseb_Bill extends StatefulWidget {
  const Kseb_Bill({Key? key}) : super(key: key);

  @override
  State<Kseb_Bill> createState() => _Kseb_BillState();
}

class _Kseb_BillState extends State<Kseb_Bill> {
  late SharedPreferences local;

  List Bill = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  @override

  fetchData()async {

    var res = await Api().getData("bill/view");
    if(res.statusCode==200){
      var items = jsonDecode(res.body);
      print(items);
      setState(() {
       Bill = items;
      });
    }else{
      setState(() {
        Bill = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        title: Text(
          'Bill Generation',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.grey, Colors.green]),
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Text(
                      'Consumer Number',
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      '*',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.orange)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Bill Number',
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
                        Bill[1]['bill_no'],
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    )),
              ),
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
                        Bill[1]['name'],
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
                        Bill[1]['amount'],
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
