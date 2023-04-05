import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kseb_project/API_service/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

import 'payment_page.dart';

class MyBill extends StatefulWidget {
  const MyBill({Key? key}) : super(key: key);

  @override
  State<MyBill> createState() => _MyBillState();
}

class _MyBillState extends State<MyBill> {
  TextEditingController billnum = TextEditingController();
  TextEditingController consumernum = TextEditingController();
  TextEditingController consumerid = TextEditingController();
  TextEditingController Ownername = TextEditingController();
  TextEditingController amount = TextEditingController();

  late SharedPreferences local;

  List complaints=[];

  Addbill()async{
  /*  local= await SharedPreferences.getInstance();
    user_id=(local.getString('user_id')?? '');
    print('user_id ${user_id}');*/

    var data ={
     "consumer_id" :consumerid.text,
     "consumer_no":consumernum.text,
     "name":Ownername.text,
     "amount":amount.text,
     "bill_no":billnum.text,
    };

    var res = await Api().AddData(data, 'bill/add');
    var body = json.decode(res.body);
    print(body);
    if(body['success']== true)
    {
     // local.setString('user_id', user_id.toString());
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Payment(),
          ));
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/ksebback.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.orange[400],
        bottomNavigationBar: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                width: double.maxFinite,
                color: Colors.grey,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(),
                        ));
                  },
                  child: Text(
                    'Go Back',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50,
                width: double.maxFinite,
                color: Colors.blue[700],
                child: TextButton(
                  onPressed: () {
                     Addbill();
                  },
                  child: Text(
                    'Pay Now',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          flexibleSpace: Image(
            image: AssetImage('images/KSEB-BillPayment.jpg'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 30),
                child: Row(
                  children: [
                    Text(
                      'Bill Number',
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  controller: billnum,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.orange)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 30),
                child: Row(
                  children: [
                    Text(
                      'Consumer id',
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  controller: consumerid,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.orange)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 30),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  controller: consumernum,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.orange)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 30),
                child: Row(
                  children: [
                    Text(
                      'Owner Name',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  controller: Ownername,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.orange)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 30),
                child: Row(
                  children: [
                    Text(
                      'Amount',
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  controller: amount,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.orange)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/botton kseb.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
