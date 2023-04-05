import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kseb_project/API_service/api.dart';
import 'package:kseb_project/user/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Complaints extends StatefulWidget {
  const Complaints({Key? key}) : super(key: key);

  @override
  State<Complaints> createState() => _ComplaintsState();
}

class _ComplaintsState extends State<Complaints> {
  TextEditingController userlocation = TextEditingController();
  TextEditingController usercomptitle = TextEditingController();
  TextEditingController usercompdes = TextEditingController();
  String user_id ="";
  late SharedPreferences local;

  List complaints=[];

  AddComplaint()async{
    local= await SharedPreferences.getInstance();
    user_id=(local.getString('user_id')?? '');
    print('user_id ${user_id}');

  var data ={
    "complaint_title":usercomptitle.text,
    "description":usercompdes.text,
    "location":userlocation.text,
     "user_id": user_id.replaceAll('"', ''),
  };

  var res = await Api().authData(data, 'complaint/add');
  var body = json.decode(res.body);
  print(body);
  if(body['success']== true)
  {
    local.setString('user_id', user_id.toString());
    Fluttertoast.showToast(
      msg: body['message'].toString(),
      backgroundColor: Colors.grey,
    );
    Navigator.push(context,
        MaterialPageRoute (builder: (context)
        {
          return Home();
        }));
  }
  else
  {
    Fluttertoast.showToast(msg: body['message'].toString(),
        backgroundColor: Colors.grey
    );

  }

  }

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
            padding: const EdgeInsets.all(5.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: 150,
                  width: double.maxFinite,
                  child: AnimatedTextKit(
                    animatedTexts: [
                      RotateAnimatedText(
                        'CUSTOMER',
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      RotateAnimatedText(
                        'COMPLAINTS',
                        textStyle: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ],
                    repeatForever: true,
                    pause: Duration(microseconds: 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    children: [
                      Text(
                        'Complaint Title',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: usercomptitle,
                  decoration: InputDecoration(
                    fillColor: Colors.white54,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'Title',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Text(
                        'Description',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: usercompdes,
                  maxLines: null,
                  decoration: InputDecoration(
                    fillColor: Colors.white54,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Text(
                        'My Location',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        '*',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
                TextFormField(
                  controller: userlocation,
                  decoration: InputDecoration(
                    fillColor: Colors.white54,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50, left: 130, right: 130),
                  child: Container(
                    width: double.maxFinite,
                    height: 39,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white54,
                    ),
                    child: TextButton(
                      onPressed: () {
                        AddComplaint();

                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
