import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kseb_project/API_service/api.dart';
import 'package:kseb_project/kseb/kseb_home.dart';
import 'package:kseb_project/kseb/login.dart';
import 'package:kseb_project/user/register_page.dart';

import 'kseb_bill.dart';

class Kseb_Register extends StatefulWidget {
  const Kseb_Register({Key? key}) : super(key: key);

  @override
  State<Kseb_Register> createState() => _Kseb_RegisterState();
}

class _Kseb_RegisterState extends State<Kseb_Register> {
  bool _obscureText = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        title: Text(
          'REGISTER FORM',
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
      body: Form(
        key: _formkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Text(
                      'UserName',
                      style: TextStyle(fontSize: 15, color: Colors.green[800]),
                    ),
                    Text(
                      '*',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                TextFormField(
                    controller: ksebusername,
                    // onChanged: (uName){},
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                    ),
                    validator: (valueName) {
                      if (valueName!.isEmpty) {
                        return 'Please Enter Name';
                      } else {
                        return null;
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Text(
                        'Phone Number',
                        style: TextStyle(fontSize: 15, color: Colors.green[800]),
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
                  keyboardType: TextInputType.number,
                  controller: ksebphone,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                    hintText: '+91',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter Mobile Number';
                    }
                    RegExp number = new RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
                    if (number.hasMatch(value)) {
                      return null;
                    } else {
                      return 'Invalid Mobile Number';
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Text(
                        'Location',
                        style:
                            TextStyle(fontSize: 15, color: Colors.green[800]),
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
                    controller: kseblocation,
                    // onChanged: (uName){},
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    ),
                    validator: (valueName) {
                      if (valueName!.isEmpty) {
                        return 'Please Enter your location';
                      } else {
                        return null;
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Text(
                        'Password',
                        style:
                            TextStyle(fontSize: 15, color: Colors.green[800]),
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
                  controller: ksebpassword,
                  // onChanged: (uPassword){},
                  obscureText: false,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.black54,
                      )),
                  validator: (valuePass) {
                    if (valuePass!.isEmpty) {
                      return 'Please enter your Password';
                    } else if (valuePass.length < 6) {
                      return 'Password too short';
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Text(
                        'Confirm Password',
                        style:
                            TextStyle(fontSize: 15, color: Colors.green[800]),
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
                  controller: conPassword,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                  ),
                  validator: (valueConPass) {
                    if (valueConPass!.isEmpty) {
                      return 'Please confirm your Password';
                    } else if (valueConPass.length < 6) {
                      return 'Please check your Password';
                    } else if (valueConPass == ksebpassword) {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 20),
                          child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Colors.grey, Colors.green]),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                                },
                                child: Text(' USER ',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white)),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 40),
                          child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Colors.grey, Colors.green]),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //         builder: (context) => Kseb_Bill(),
                                //       ));
                                  ksebRegisterdata();
                                 };
                              },
                              child: Text('SUBMIT',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextEditingController ksebusername = TextEditingController();
  TextEditingController ksebphone = TextEditingController();
  TextEditingController kseblocation = TextEditingController();
  TextEditingController ksebpassword = TextEditingController();
  TextEditingController conPassword = TextEditingController();

  void reset() {
    setState(() {
      ksebusername.text = '';
      kseblocation.text = '';
      ksebpassword.text = '';
      conPassword.text = '';
    });
  }
  void ksebRegisterdata() async
  {
    var data ={
      "username" : ksebusername.text,
      "phone" : ksebphone.text,
      "location" :kseblocation.text,
      "password" : ksebpassword.text,
    };

    var res = await Api().authData(data, 'kseb/register');
    var body = json.decode(res.body);

    if(body['success']== true)
    {
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Navigator.pushReplacement(context,
          MaterialPageRoute (builder: (context)
          {
            return Home_kseb();
          }));
    }
    else
    {
      Fluttertoast.showToast(msg: body['message'].toString(),
          backgroundColor: Colors.grey
      );

    }

  }

}
