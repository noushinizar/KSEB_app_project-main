import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kseb_project/API_service/api.dart';
import 'package:kseb_project/kseb/kseb_home.dart';

import 'kseb_register.dart';

class LoginKseb extends StatefulWidget {
  const LoginKseb({Key? key}) : super(key: key);

  @override
  State<LoginKseb> createState() => _LoginKsebState();
}

class _LoginKsebState extends State<LoginKseb> {
  TextEditingController ksebemail = TextEditingController();
  TextEditingController ksebpassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            shrinkWrap: true,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'KSEB',
                        style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 39,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 39,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Text(
                      'Login to your account',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  'Email',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              TextFormField(
                controller: ksebemail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Password',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
              ),
              TextFormField(
                controller: ksebpassword,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 50),
                child: Container(
                  height: 55,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue),
                  child: TextButton(
                    onPressed: () {
                      KsebLogindata();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not Yet Registered ?',
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Kseb_Register(),
                              ));
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  KsebLogindata() async
  {
    var data = {
      "email": ksebemail.text,
      "password": ksebpassword.text,
    };

    var res = await Api().authData(data, 'kseb/login');
    var body = json.decode(res.body);

    if (body['success'] == true) {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

      Navigator.push(context, MaterialPageRoute(builder: (context) => Home_kseb()
      ));
    }


    else {
      Fluttertoast.showToast(msg: body['message'].toString(),
          backgroundColor: Colors.grey
      );
    }
  }
}
