import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kseb_project/API_service/api.dart';
import 'package:kseb_project/kseb/kseb_home.dart';
import 'package:kseb_project/user/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'register_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;

  String user = "1";
  String kseb ="2";
  String storedvalue ="1";

  late SharedPreferences local;
  String login_id = "";
  String kseb_id="";
  String user_id ="";
  String role = "";
  String status = "";


  bool isloading = false;

  TextEditingController username = TextEditingController();
  TextEditingController userpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: [
              Center(child: Image(image: AssetImage('images/kseb.jpg'))),
              Padding(
                padding: const EdgeInsets.only(right: 5, left: 5, top: 50),
                child: TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      hintText: 'User Name',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 5, vertical: 5)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5, left: 5, top: 30),
                child: TextFormField(
                  controller: userpassword,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    hintText: 'Password',
                    suffixIcon:  GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: 5, vertical: 5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5, left: 5, top: 50),
                child: Container(
                  height: 40,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.blue[800]),
                  child: TextButton(
                    onPressed: () {
                      UserLogindata();
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5, left: 5, top: 80),
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
                                builder: (context) => const Register(),
                              ));
                        },
                        child: Text('Register Now'))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  UserLogindata() async
  {
    setState(() {
      isloading=true;
    });
    var data = {
      "username": username.text,
      "password": userpassword.text,
    };

    var res = await Api().authData(data, 'users/login');
    var body = json.decode(res.body);

    if (body['success'] == true) {
      print(body);
      role= json.encode(body['role']);
      status = json.encode(body['status']);
      login_id = json.encode(body['login_id']);
      kseb_id = json.encode(body['kseb_id']);
      user_id = json.encode(body['user_id']);
      local = await SharedPreferences.getInstance();
      local.setString('role', role.toString());
      local.setString('login_id', login_id.toString());
      local.setString('kseb_id', kseb_id.toString());
      local.setString('user_id', user_id.toString());
      print('user${user}');
      print('role${role}');
      print('storedvalue${storedvalue}');
      print('status${status}');
      print('userid${user_id}');
      if(user == role.replaceAll('"', '') && storedvalue == status.replaceAll('"', '') ){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
      }
      else if(kseb == role.replaceAll('"', '') && storedvalue == status.replaceAll('"', '')){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_kseb()));
      }
      else {
        Fluttertoast.showToast(msg: body['message'].toString(),
            backgroundColor: Colors.grey
        );
      }


    }
    else {
      Fluttertoast.showToast(msg: body['message'].toString(),
          backgroundColor: Colors.grey
      );
    }
  }
}