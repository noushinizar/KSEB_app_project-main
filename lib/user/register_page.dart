import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kseb_project/API_service/api.dart';
import 'package:kseb_project/kseb/kseb_register.dart';
import 'package:kseb_project/user/login_page.dart';

import 'home_page.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   decoration: BoxDecoration(
    //     gradient: LinearGradient(
    //         begin: Alignment.topLeft,
    //         end: Alignment.bottomRight,
    //         colors: [Colors.grey, Colors.green]),
    //   ),
    child:
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Form(
            key: _formkey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Text(
                      'Full Name',
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
                    controller: userName,
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
                        'Address',
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
                    controller: userAddress,
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
                        return 'Please Enter Address';
                      } else {
                        return null;
                      }
                    }),
                // SizedBox(height: 30),
                // Row(
                //   children: [
                //     Text(
                //       'Address',
                //       style: TextStyle(fontSize: 20, color: Colors.green[800]),
                //     ),
                //     Text(
                //       '*',
                //       style: TextStyle(
                //           color: Colors.red, fontWeight: FontWeight.bold),
                //     )
                //   ],
                // ),
                // Form(
                //   key: _addressFormkey,
                //   child: TextFormField(
                //     controller: userAddress,
                //     // onChanged: (uAddress){},
                //     maxLines: null,
                //     decoration: InputDecoration(
                //       fillColor: Colors.white,
                //       filled: true,
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(5)),
                //     ),
                //     validator: (valueAddress) {
                //       if (valueAddress!.isEmpty) {
                //         return 'Please Enter Address';
                //       } else {
                //         addressValid = true;
                //       }
                //     },
                //   ),
                // ),
                // SizedBox(height: 45),
                // Row(
                //   children: [
                //     Expanded(
                //       flex: 2,
                //       child: DropdownButtonFormField<String>(
                //           decoration: InputDecoration(
                //               fillColor: Colors.white,
                //               filled: true,
                //               border: OutlineInputBorder(
                //                   borderRadius: BorderRadius.circular(5))),
                //           hint: Text('Current City'),
                //           value: selectCity,
                //           items: city
                //               .map((cities) => DropdownMenuItem<String>(
                //                   value: cities, child: Text(cities)))
                //               .toList(),
                //           onChanged: (cities) {
                //             selectCity = cities;
                //           }),
                //     ),
                //     SizedBox(width: 5),
                //     Expanded(
                //       child: TextFormField(
                //         controller: userPincode,
                //         // onChanged: (uPin){},
                //         decoration: InputDecoration(
                //           fillColor: Colors.white,
                //           filled: true,
                //           hintText: 'Pincode',
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(5)),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 30),
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
                  controller: userNumber,
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
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Text(
                        'Email Id',
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
                    controller: userEmail,
                    // onChanged: (uEmail){},
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                        hintText: '@gmail.com'),
                    validator: (valueMail) {
                      if (valueMail!.isEmpty) {
                        return 'Please enter Email Id';
                      }
                      RegExp email = new RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (email.hasMatch(valueMail)) {
                        return null;
                      } else {
                        return 'Invalid Email Id';
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Text(
                        'Password',
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
                  controller: userPassword,
                  // onChanged: (uPassword){},
                  obscureText: false,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.black54,
                      )),
                  validator: (valuePass) {
                    if (valuePass!.isEmpty) {
                      return 'Please enter your Password';
                    }else if(valuePass.length<6){
                      return 'Password too short';
                    } else {
                      return null;
                    }
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Text(
                        'Confirm Password',
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
                  controller: userConPassword,
                  obscureText: false,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5)),
                      contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 5),
                      suffixIcon: Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.black54,
                      )),
                  validator: (valueConPass) {
                    if (valueConPass!.isEmpty) {
                      return 'Please confirm your Password';
                    } else if (valueConPass.length<6) {
                      return 'Please check your Password';
                    }else if (valueConPass == userPassword){
                      return null;
                    }
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40,right: 20),
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Kseb_Register()));
                                },
                                child: Text('KSEB',
                                    style:
                                        TextStyle(fontSize: 20, color: Colors.white)),
                              )),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20,right: 40),
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

                                    Registerdata();
                                  };
                                },
                                  child:Text('SUBMIT',
                                      style:
                                      TextStyle(
                                          fontSize: 20, color: Colors.white)
                                  ),
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
      // ),
    );
  }

  // final List city = [
  //   'Thiruvananthapuram',
  //   'Kollam',
  //   'Pathanamthitta',
  //   'Alapuzha',
  //   'Kottayam',
  //   'Idukki',
  //   'Ernakulam',
  //   'Thrissur',
  //   'Palakkad',
  //   'Malappuram',
  //   'Kozhikode',
  //   'Wayanad',
  //   'Kannur',
  //   'Kasargod'
  // ];
  // String? selectCity;
  // String userName='';
  // String userAddress='';
  // String userPincode='';
  // String userNumber='';
  // String userEmail='';
  // String userPassword='';
  TextEditingController userName = TextEditingController();
  TextEditingController userAddress = TextEditingController();
  // TextEditingController userPincode = TextEditingController();
  TextEditingController userNumber = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController userConPassword = TextEditingController();

  void reset() {
    setState(() {
      userName.text = '';
      userAddress.text = '';
      // userPincode.text = '';
      userNumber.text = '';
      userEmail.text = '';
      userPassword.text = '';
      userConPassword.text = '';
    });
  }


void Registerdata() async
{
  var data ={
    "username" :  userName.text,
    "email" : userEmail.text,
    "phone" : userNumber.text,
    "address" :userAddress.text,
    "password" : userPassword.text,
  };

  var res = await Api().authData(data, 'users//register');
  var body = json.decode(res.body);
    print(body);
  if(body['success']== true)
  {
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
}
