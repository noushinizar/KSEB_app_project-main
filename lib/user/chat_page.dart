import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kseb_project/API_service/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  TextEditingController content = TextEditingController();
  String user_id ="";
  late SharedPreferences local;

  List chat=[];

  send()async{
    local= await SharedPreferences.getInstance();
    user_id=(local.getString('user_id')?? '');
    print('user_id ${user_id}');

    var data ={
      "status": "1",
      "content":content.text,
      "user_id": user_id.replaceAll('"', ''),
    };
     print(data);
    var res = await Api().authData(data, 'chat/add');
    var body = json.decode(res.body);
    print(body);
    if(body['success']== true)
    {

      local.setString('user_id', user_id.toString());
      Fluttertoast.showToast(
        msg: body['message'].toString(),
        backgroundColor: Colors.grey,
      );

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
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(5.0),
        child: TextFormField(
          controller: content,
          maxLines: null,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              hintText: 'Type Here',
              suffixIcon: IconButton(
                onPressed: (){
                  send();
                },
                icon: Icon(
                  Icons.send,
                  color: Colors.green[700],
                ),
              )),
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Messages',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[700],
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 5, right: 80),
            child: Card(
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'user message replay',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 80, right: 5),
            child: Card(
              color: Colors.grey[300],
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'user message send',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
